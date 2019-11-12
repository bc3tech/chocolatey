$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = '$url$'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = '$sha$'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs