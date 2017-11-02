$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.11/franz-setup-5.0.0-beta.11.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = ''
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = 'CDBD31C0B4151BA34EAE6C0D3651355E1C2F0C055E200F9B6886497B97EBC25D'
  checksumType  = 'SHA256'
}

Install-ChocolateyPackage @packageArgs