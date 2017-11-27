$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.14/franz-setup-5.0.0-beta.14.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = '75E4EB7FE8C6DC7A62C4FF79918E797253D1CEADD28DD60495DFB535CFD1364D'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\$($packageName)\tools\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs