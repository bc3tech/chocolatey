
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
  checksum      = '0CC19D724F4F7BF459347AA8582E8531B923446C8471681C66D71DCAA056CACC'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs