
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
  checksum      = '879DE2AB3A59B420BCB001DC455B577F'
  checksumType  = 'md5'
  checksum64    = '879DE2AB3A59B420BCB001DC455B577F'
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs