$ErrorActionPreference = 'Stop';

$packageName= 'microsoftteams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://statics.teams.microsoft.com/production-windows/0.7.00.3101/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/0.7.00.3101/Teams_windows_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Microsoft Teams*'

  checksum      = '382F6E20B296459E19415C3F7938D01708495C9AD67FB507C2CCD99056859B95'
  checksumType  = 'sha256'
  checksum64    = 'BA90EDB3C8CD38F658995C1EC48E0E5286559D169A02082126C2C95177FE2876'
  checksumType64= 'sha256'

  silentArgs   = '-s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

Write-Output "Pinning Microsoft Teams version since it auto-updates upon launch"
choco pin add -n=microsoftteams