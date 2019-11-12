$ErrorActionPreference = 'Stop';

$file = Join-Path (Join-Path (Join-Path $env:LOCALAPPDATA Microsoft) Teams) Update.exe

Start-ChocolateyProcessAsAdmin -ExeToRun $file -Statements "--uninstall -s"