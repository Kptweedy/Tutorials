# Useful Tools
This is a collection of useful tools that are used in the various processes 

## Scripts

### Texconv Script

These Scripts use the Texconv tool by microsoft, you need to put these in the same directory as the scripts.  
Acquired from [Microsoft](https://github.com/Microsoft/DirectXTex/wiki/Texconv).  

Converts DDS textures to a more usable format. 
Script created by the awesome [Puxtril](https://github.com/Puxtril).  

Script [Texconv](../../assets/files/ConvertTexturesDDS.ps1)  

Converts .dds textures to .png, .tga, .tiff and/or .bmp.  (1)
{ .annotate }

1.  Could possibly be any of: .bmp, .jpg, .jpeg, .png, .dds, .tga, .hdr, .tif, .tiff, .wdp, .hdp, .jxr, .ppm, .pfm, .heic and/or .heif.  
   However the script is only written to handle the displayed options, reading the texvonv [documentation](https://github.com/Microsoft/DirectXTex/wiki/Texconv) is reccomended for using other formats.  

??? abstract "Script Source"
    
    ```powershell
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

    # Should this extract recursively?
    $RecurseFlag = "-r:keep"
    $isRecursive = Read-Host -Prompt "Extract recursively? [y/n]"
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
    Write-Host "Ready to convert, press any key to continue..."
    Read-Host

    # Allow us to Ctrl+C out of this
    $Process = Start-Process -PassThru -NoNewWindow -FilePath ".\texconv.exe" -ArgumentList $Arguments
    try {
        $Process
        While(!$Process.HasExited) { Start-Sleep 1 }
    }
    finally {
        $Process | Stop-Process
        Write-Host "Done, press any key to exit..."
        Read-Host
    }
    ```  

### "Multipurpose" script  
Script created by [Kptweedy](https://github.com/Kptweedy) with assistance from [Puxtrill](https://github.com/Puxtril).  

Simplifies Extrator command entries to:  

- Extractor Path  
- Cache Dir  
- Output Path  
- Internal Path  
- Extractor commands to run  

Runs Texconv script.  

Converts `{ }` to `[ ]` in material .txt files so that colours can be directly pasted into Blender. 

Zips the folder for easier sharing
<!-- Generates a file tree for easier searching of materials-->
<!-- Coming soon -->  

Script [Multipurpose script](../../assets/files/everything-script.ps1)

??? abstract "Script Source"
    ```powershell
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

    ```
<!--
```
```
-->

### Blender Import Helper Script  

This script helps with the import process by automating: flipping normals, merging by distance, resetting vectors and shading smooth. 

To use this script copy the text below to a text editor pane and then select all of the meshes to run it on and then press the run script button.
??? abstract "Script"

    ```py
    import bpy

    # Select the active object
    obj = bpy.context.active_object

    # 
    for obj in bpy.context.selected_objects:

        # Edit mode
        bpy.ops.object.mode_set(mode='EDIT')
        
        # Flip Normals    
        bpy.ops.mesh.flip_normals()

        # Remove Doubles
        bpy.ops.mesh.remove_doubles()

        # Reset Normals
        bpy.ops.mesh.normals_tools(mode='RESET')
        
        # Object mode    
        bpy.ops.object.mode_set(mode='OBJECT')

        # Shade Smooth
        bpy.ops.object.shade_smooth()
    ```


## Applications  

### [3d Viewer](https://www.microsoft.com/store/productId/9NBLGGH42THS)
- ***Should Come With Windows*** 
This program is useful for quickly viewing the 3d models that are exported with the exporter.  

### [XnView MP](https://www.xnview.com/en/)  
- ***Freeware***  

XnView MP can be used to browse exported files with fast thumbnail generation and a preview that works with .dds files, can also be used to convert .dds files to other image formats.  

### [Everything Search](https://www.voidtools.com/)
- ***Freeware***  

Very powerful searching tool that will help you find files in an instant 

### WTV & DDS Utils  
- ***Freeware & Possibly Unsafe***  

I acquired these files from various websites on the internet ([Softpedia](https://www.softpedia.com/get/Multimedia/Graphic/Graphic-Viewers/WTV.shtml) & [ModDB](https://www.moddb.com/downloads/nvidia-dds-utilities)) DDS Utils is needed for WTV to work. Don't install them if you don't trust them.  

[WTV&DDS Utils](../../assets/files/WTV&DDS_Utils.7z)  
WTV(Windows Texture Viewer) is quite useful for quickly opening a .dds file and previewing the separate colour channels.  