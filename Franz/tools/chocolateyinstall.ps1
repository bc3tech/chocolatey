$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.13/franz-setup-5.0.0-beta.13.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = 'D44564356B2CD8605232104750A8E62AD3C27E9F9A1BAA8CEBFC2239184B2060'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\$($packageName)\tools\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs