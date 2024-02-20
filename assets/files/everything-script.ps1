Write-Host "Script made mostly by ai (except for DDS conversion script was made by the great Puxtril)."

# Prompt the user for the Warframe-Exporter.exe path (default: .\Warframe-Exporter.exe)
$warframeExporterPath = Read-Host "Enter the path to Warframe-Exporter.exe (Default: .\Warframe-Exporter.exe)"
if ($warframeExporterPath -eq "") {
    $warframeExporterPath = ".\Warframe-Exporter.exe"
}

# Prompt the user for the cache directory (default: D:\Program Files (x86)\Steam\steamapps\common\Warframe\Cache.Windows)
$cacheDir = Read-Host "Enter the cache directory"
if ($cacheDir -eq "") {
    $cacheDir = 'C:\Program Files (x86)\Steam\steamapps\common\Warframe\Cache.Windows'
}

# URL of the Warframe updates page
$url = "https://www.warframe.com/updates/pc"

# Fetch the HTML content and extract the version number using regex
$htmlContent = Invoke-WebRequest -Uri $url
$versionNumberMatch = $htmlContent.Content -match '<div class="pcVersion">.*? (\d+\.\d+\.\d+)</div>'

if ($versionNumberMatch) {
    $versionNumber = $matches[1]
} else {
    Write-Host "Failed"
}

# Prompt the user for the common output path (default: .\Test)
$outputPath = Read-Host "Enter the output path (Default: .\)"
if ($outputPath -eq "") {
    $outputPath = ".\$versionNumber($(get-date -f yyyy-MM-dd))"
}

# Prompt the user for the internal path (default: /Lotus/Character/Tenno/Wraithe)
$internalPath = Read-Host "Enter the internal path (Default: /Lotus)"
if ($internalPath -eq "") {
    $internalPath = "/Lotus"
}

# Define the extraction options
$extractionOptions = @{
    1 = "--extract-textures"
    2 = "--extract-models"
    3 = "--extract-materials"
    4 = "--extract-levels"
    5 = "--extract-audio"
}

# Display menu
Write-Host "Choose extraction options (Enter numbers separated by commas):"
foreach ($option in $extractionOptions.GetEnumerator()) {
    Write-Host "$($option.Key): $($option.Value)"
}
$userSelection = Read-Host "Enter your selection"

# Convert user input to an array of selected options
$selectedOptions = $userSelection -split ',' | ForEach-Object {
    $trimmedOption = $_.Trim()
    $optionKey = [int]$trimmedOption
    if ($extractionOptions.ContainsKey($optionKey)) {
        $extractionOptions[$optionKey]
    }
}


# Iterate through each selected extraction option
foreach ($option in $selectedOptions) {
    # Build the full command with the current extraction option and common output path
    $fullCommand = "$warframeExporterPath --cache-dir ""$cacheDir"" $option --output-path ""$outputPath"""

    # Add internal path if provided
    if ($internalPath -ne "") {
        $fullCommand += " --internal-path $internalPath"
    }

    # Print the command to the console
    Write-Host "Running command: $fullCommand"

    # Execute the command
    Invoke-Expression $fullCommand
}

# Ask the user if they want to run the second script
$runSecondScript = Read-Host "Do you wish to run the Texture converter script? (y/N)"
if ($runSecondScript -eq "y" -or $runSecondScript -eq "Y") {
    #########################################################################
    # Convert .dds textures to something more usable
    # Created by Puxtril

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.IO

    #########################################################################
    # Checks

    if (-not(Test-Path -Path "./texconv.exe"))
    {
        Write-Host "Put texconv.exe in the same folder as this script."
        Write-Host "https://github.com/Microsoft/DirectXTex/wiki/Texconv"
        Read-Host -Prompt "Press any key to quit..."
        exit
    }

    #########################################################################
    # Helper Functions

    function Get-Fourcc {
        param(
            [Parameter(Mandatory=$true)]
            [String] $FilePath
        )
        process {
            $Reader = [System.IO.BinaryReader][System.IO.File]::Open($FilePath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read)
            $Reader.BaseStream.seek(0x54, [System.IO.SeekOrigin]::Begin) | Out-Null
            $FourCC = [System.Text.Encoding]::ASCII.GetString($Reader.ReadBytes(4))
            $Reader.close()
            return $FourCC
        }
    }

    #########################################################################
    # User Input Options

    # Ask the user if they would like to reuse $outputPath
    $reuseOutputPath = Read-Host "Do you wish to reuse the previous output path? (y/N)"
    if ($reuseOutputPath -eq 'Y' -or $reuseOutputPath -eq 'y') {
        $TexDirSrc = $outputPath
        $TexDirDst = $outputPath
    }
    else {
        # Get input texture folder
        #$dialog = [System.Windows.Forms.FolderBrowserDialog]::new()
        #$dialog.Description = 'Input texture folder'
        #$dialog.ShowNewFolderButton = $false
        #$null = $dialog.ShowDialog()
        Write-Host "Input Path:"
        $TexDirSrc = Read-Host
        $TexDirSrc = """$TexDirSrc"""
        #$dialog.Dispose()

        # Get output texture folder
        #$dialog = [System.Windows.Forms.FolderBrowserDialog]::new()
        #$dialog.Description = 'Output texture folder'
        #$null = $dialog.ShowDialog()
        Write-Host "Output Path:"
        $TexDirDst = Read-Host
        $TexDirDst = """$TexDirDst"""
        #$dialog.Dispose()
    }

    # Save the output path for reuse
    $outputPath = $TexDirDst

    # Should this extract recursively?
    $RecurseFlag = "-r:keep"
    $isRecursive = Read-Host -Prompt "Extract recursively? [y/N]"
    if ($isRecursive -match "[yY]") { $RecurseFlag = "-r:keep" }

    # Output FileType
    # I just copied some valid options from the texconv.exe help menu
    Write-Host "Choose the output file type"
    Write-Host "PNG TGA TIF BMP"
    $FileType = Read-host -Prompt "Format"

    #########################################################################
    # Building the base arguments

    $Arguments = "-ft",$FileType,"-f","R8G8B8A8_UNORM"
    if ($Recurse -ne "") { $Arguments += $RecurseFlag }
    $Arguments +=  "-o",$TexDirDst,"$TexDirSrc\*.dds"

    #########################################################################
    # Command Execution

    Write-Host "Press Ctrl+C to exit while running."
    Write-Host "Ready to convert, this may take a while, press any key to continue..."
    Read-Host

    # Allow us to Ctrl+C out of this
    $Process = Start-Process -PassThru -NoNewWindow -FilePath ".\texconv.exe" -ArgumentList $Arguments
    try {
        $Process
        While(!$Process.HasExited) { Start-Sleep 1 }
    }
    finally {
        $Process | Stop-Process
        Write-Host "Done"
    }
}
else {
    Write-Host "Texture Converter Skipped"
}

function Edit-BracketContent {
    param (
        [string]$txtFilePath
    )

    $content = Get-Content -Path $txtFilePath -Raw

    # Replace curly brackets with square brackets
    $modifiedContent = $content -replace '\{', '[' -replace '\}', ']'

    Set-Content -Path $txtFilePath -Value $modifiedContent
}

function Edit-FolderContent {
    param (
        [string]$folderPath
    )
    
    $files = Get-ChildItem -Path $folderPath -Filter *.txt -File -Recurse

    foreach ($file in $files) {
        Edit-BracketContent -txtFilePath $file.FullName
        Write-Host "Processed: $($file.FullName)"
    }
}

function Show-YesNoPrompt {
    param (
        [string]$message
    )

    $response = Read-Host "$message (y/N)"
    return $response -eq 'Y' -or $response -eq 'y'
}

$runReplacer = Show-YesNoPrompt -message "Would you like to run the text replacer?"

if ($runReplacer) {
    # Ask if the user wants to reuse the old output path
    $reuseOutputPath = Show-YesNoPrompt -message "Would you like to reuse the old output path?"

    if ($reuseOutputPath) {
        Write-Host "Output path set to: $outputPath"
        $folderPath = $outputPath
        Edit-FolderContent -folderPath $folderPath
        Write-Host "Bracket replacement complete."
    } else {
        $outputPath = Read-Host "Enter the desired output path: "
        Write-Host "Output path set to: $outputPath"
        Edit-FolderContent -folderPath $outputPath
        Write-Host "Bracket replacement complete."
    }
} else {
    Write-Host "Text replacer skipped."
}

# Define the path to 7z executable (adjust as needed)
$7zPath = "C:\Program Files\7-Zip\7z.exe"

# Specify the directory you want to zip and the desired output zip file
$outputPath
$outputZipFile = "$outputPath.zip"

# Ask for user confirmation
$zipIt = Show-YesNoPrompt -message "Would you like to zip the files up?"

if ($zipIt) {
    # Build the 7z command for compressing the entire directory with maximum compression
    $7zCommand = "& '$7zPath' a -tzip -mx9 '$outputZipFile' '$outputPath\*'"
    
    # Execute the 7z command
    Invoke-Expression $7zCommand
}
