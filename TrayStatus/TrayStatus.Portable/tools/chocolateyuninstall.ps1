$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TrayStatus'
Uninstall-ChocolateyZipPackage $packageName