$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TrayStatus'
Uninstall-ChocolateyZipPackage $packageName 'TrayStatus-4.3.zip.txt'
