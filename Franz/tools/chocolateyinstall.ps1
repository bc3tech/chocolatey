$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-win32-ia32-4.0.4.zip'
$url64      = 'https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-win32-x64-4.0.4.zip'
$fileType = 'EXE'
$silentArgs = ''

$zipInstallDir = Install-ChocolateyZipPackage $packageName $url -Checksum "16A4CB546F6841580295907285FBBEA047198617" -ChecksumType "SHA1" $toolsDir $url64 -Checksum64 "F6B59469CBA577C0DA8B477C5D3CB3E41627114F" -ChecksumType64 "SHA1"

$fileInstallLocation = Join-Path $zipInstallDir 'FranzSetup.exe'
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs "$fileInstallLocation"