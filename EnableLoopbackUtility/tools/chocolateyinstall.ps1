$ErrorActionPreference = 'Stop';


$packageName= 'EnableLoopbackUtility'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://telerik-fiddler.s3.amazonaws.com/fiddler/addons/enableloopbackutility.exe'
$url64      = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'

  softwareName  = 'EnableLoopbackUtility*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs

















