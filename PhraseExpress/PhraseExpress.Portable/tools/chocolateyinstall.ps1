
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
  checksum      = '10D7E013B7949142890A1C5612A3061E'
  checksumType  = 'md5'
  checksum64    = '10D7E013B7949142890A1C5612A3061E'
  checksumType64= 'md5'
}

Install-ChocolateyZipPackage @packageArgs