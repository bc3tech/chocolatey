$ErrorActionPreference = 'Stop';

$packageName= 'tweeten'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/MehediH/Tweeten/releases/download/v4.7.0/TweetenSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Tweeten*'
  checksum      = 'FCABF2ACBF5F306CE49AB91D130B6219E28E1C858A899C2C01073D8DB43B87D4'
  checksumType  = 'sha256'
}

New-Item "$($toolsDir)\TweetenSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs