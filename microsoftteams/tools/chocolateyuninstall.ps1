$ErrorActionPreference = 'Stop';

$packageName = 'microsoftteams'
$softwareName = 'Microsoft Teams*'
$installerType = 'EXE' 

if ($installerType -ne 'MSI') {
  $silentArgs = '-s'
  $validExitCodes = @(0)
}

$uninstalled = $false

$file = Join-Path (Join-Path (Join-Path $env:LOCALAPPDATA Microsoft) Teams) Update.exe

Start-ChocolateyProcessAsAdmin -ExeToRun $file -Statements "--uninstall -s"