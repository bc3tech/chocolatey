$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$regKey = Get-ItemProperty -Path 'HKCU:\Software\Vivaldi'
$packageArgs = @{
    packageName    = $packageName
    file           = "$($regKey.UninstallString)"
    silentArgs     = "$($($regKey.UninstallArguments).Replace('--vivaldi','')) --vivaldi-silent --do-not-launch-chrome"
    validExitCodes = @(0,19)
}

Uninstall-ChocolateyPackage @packageArgs 