
$ErrorActionPreference = 'Stop';


$packageName= 'VisualStudio15'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 
$url64      = $url

Get-ChocolateyWebFile 'VisualStudio15' "$env:temp\vs15.preview2.ent_enu.iso" 'http://download.microsoft.com/download/f/a/5/fa54602e-9782-45d9-a410-a837da46acc3/vs15.preview2.ent_enu.iso'
imdisk -a -f "$env:temp\vs15.preview2.ent_enu.iso" -m "w:"
Install-ChocolateyInstallPackage 'VisualStudio15' 'exe' '/q' 'w:\Setup.exe'
imdisk -d -m w: