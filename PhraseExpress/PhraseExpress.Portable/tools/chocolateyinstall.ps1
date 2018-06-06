
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.phraseexpress.com/PhraseExpress_USB.zip' 
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  url64bit      = $url64


  softwareName  = 'PhraseExpress.Portable*'
  checksum      = '2911731AB3538F64287CD9CE08EEC82871BBCCF667B99779661A766629BB90EB'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs