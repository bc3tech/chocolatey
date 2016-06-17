$ErrorActionPreference = 'Stop';

$packageName= 'TelerikControlPanel'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

	7z x -aoa -bb0 -bso0 -o"$($toolsDir)" "tools\TelerikControlPanelSetup_2016_2_0516_1.zip"

	Write-Host 'Creating desktop shortcut...'
$desktopFolderLocation = [Environment]::GetFolderPath("Desktop")
$shortcutPath = [System.IO.Path]::Combine($desktopFolderLocation, "Telerik Control Panel.lnk")
Install-ChocolateyShortcut $shortcutPath "$($toolsDir)\telerikcontrolpanel.exe" -RunAsAdmin