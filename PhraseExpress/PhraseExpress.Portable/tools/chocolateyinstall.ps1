
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
  checksum      = '6614FAB0075C518C3FBCD3C7B15B095D'
  checksumType  = 'md5'
  checksum64    = '6614FAB0075C518C3FBCD3C7B15B095D'
  checksumType64= 'md5'
}

Install-ChocolateyZipPackage @packageArgs