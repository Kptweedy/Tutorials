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
