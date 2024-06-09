
$ErrorActionPreference = 'Stop';


$packageName = 'PhraseExpress.Portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '$zipurl$' 
$url64 = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  url64bit      = $url64


  softwareName  = 'PhraseExpress.Portable*'
  checksum      = '$zipsha$'
  checksum64    = '$zipsha$'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs