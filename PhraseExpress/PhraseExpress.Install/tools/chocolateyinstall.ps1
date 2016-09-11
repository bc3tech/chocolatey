
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
  checksum      = 'FDF38C5BCEC4E751DB427FF26F9255DDE16FFC24'
  checksumType  = 'SHA1'
  checksum64    = 'FDF38C5BCEC4E751DB427FF26F9255DDE16FFC24'
  checksumType64= 'SHA1'
}

Install-ChocolateyPackage @packageArgs