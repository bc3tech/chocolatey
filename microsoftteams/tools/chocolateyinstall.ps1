$ErrorActionPreference = 'Stop';

$packageName= 'microsoftteams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://statics.teams.microsoft.com/production-windows/1.2.00.27559/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.27559/Teams_windows_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Microsoft Teams*'

  checksum      = '505F61AE810D85D03EE515E1F0DE09DF5C369DADE7F1B53B881B8A238D2ACE6F'
  checksumType  = 'sha256'
  checksum64    = 'B3059E6275BE05EB229102722B5CDD276745D0EEE521461E37B0065717D48482'
  checksumType64= 'sha256'

  silentArgs   = '-s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

Write-Output "Since Microsoft Teams auto-updates on launch, you should pin its version by typing"
Write-Output "choco pin add -n=microsoftteams"