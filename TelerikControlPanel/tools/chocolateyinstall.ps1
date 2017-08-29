$ErrorActionPreference = 'Stop';

$packageName= 'TelerikControlPanel'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

	7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" "tools\TelerikControlPanelSetup_2017_3_0814_1.zip"

	Write-Host 'Creating desktop shortcut...'
$desktopFolderLocation = [Environment]::GetFolderPath("Desktop")
$shortcutPath = [System.IO.Path]::Combine($desktopFolderLocation, "Telerik Control Panel.lnk")
Install-ChocolateyShortcut $shortcutPath "$($toolsDir)\\$($packageName)\telerikcontrolpanel.exe" -RunAsAdmin

Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\setup.exe.ignore" -type file -force | Out-Null
