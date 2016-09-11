
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.phraseexpress.com/PhraseExpress_USB.zip'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  url64bit      = $url64


  softwareName  = 'PhraseExpress.Portable*'
  checksum      = '013D7FE4E726A168371AA18C2E28376370A9F91B'
  checksumType  = 'SHA1'
  checksum64    = '013D7FE4E726A168371AA18C2E28376370A9F91B'
  checksumType64= 'SHA1'
}

Install-ChocolateyZipPackage @packageArgs