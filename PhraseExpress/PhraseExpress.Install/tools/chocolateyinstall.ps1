
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.phraseexpress.com/PhraseExpressSetup.exe'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PhraseExpress.Install*'
  checksum      = '0A5E24CE98B4AE431A4A2054906611D2'
  checksumType  = 'md5'
  checksum64    = '0A5E24CE98B4AE431A4A2054906611D2'
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs