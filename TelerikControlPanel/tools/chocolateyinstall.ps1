$ErrorActionPreference = 'Stop';

$packageName= 'TelerikControlPanel'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "tools\TelerikControlPanelSetup_2016_2_0516_1.exe" $toolsDir
Write-Host 'Creating desktop shortcut...'
$desktopFolderLocation = [Environment]::GetFolderPath("Desktop")
$shortcutPath = [System.IO.Path]::Combine($desktopFolderLocation, "Telerik Control Panel.lnk")
Install-ChocolateyShortcut $shortcutPath "$($toolsDir)\telerikcontrolpanel.exe" -RunAsAdmin