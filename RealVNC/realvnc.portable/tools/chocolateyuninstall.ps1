

$ErrorActionPreference = 'Stop';

$packageName = 'realvnc.portable'
$softwareName = 'realvnc*'

Uninstall-ChocolateyZipPackage $packageName

