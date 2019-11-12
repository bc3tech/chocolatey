$ErrorActionPreference = 'Stop';

$packageName= 'tweeten'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = '$url$'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Tweeten*'
  checksum      = '$sha$'
  checksumType  = 'sha256'
}

New-Item "$($toolsDir)\TweetenSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs