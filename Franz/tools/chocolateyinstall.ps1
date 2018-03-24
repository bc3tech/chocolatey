$ErrorActionPreference = 'Stop';

$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.17/franz-setup-5.0.0-beta.17.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'franz*'
  checksum      = '21956DF668DEEB25F3726B7A5B929D63B93284E63223B482FFA8E60FDF441307'
  checksumType  = 'SHA256'
}

New-Item "$($toolsDir)\$($packageName)\tools\FranzSetup.exe.ignore" -type file -force | Out-Null

Install-ChocolateyPackage @packageArgs