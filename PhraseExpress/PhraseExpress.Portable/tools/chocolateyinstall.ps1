
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
  checksum      = 'C9FE71DF31B6B50D936C5130DC862A513D3C5B0389E280076043D64A5223D78C'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs