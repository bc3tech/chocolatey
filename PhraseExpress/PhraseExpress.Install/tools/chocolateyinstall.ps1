
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.phraseexpress.com/PhraseExpressSetup.msi'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/qn /norestart "
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PhraseExpress.Install*'
  checksum      = 'DC5D23E5A3513AC2D6F42548DFF02954'
  checksumType  = 'md5'
  checksum64    = 'DC5D23E5A3513AC2D6F42548DFF02954'
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs