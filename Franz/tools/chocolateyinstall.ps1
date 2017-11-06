$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.12/franz-setup-5.0.0-beta.12.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = 'F87F9F9679DB9C979EA8752F3DE933535A768E10966503F62926033ACDAFF05B'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\$($packageName)\tools\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs