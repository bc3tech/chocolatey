$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.18/franz-setup-5.0.0-beta.18.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = 'BB975D60C923CF42B900ADF7FCF5C79E6BD937759AB3717AD988C0A9C16BFC7A'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\$($packageName)\tools\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs