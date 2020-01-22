$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$regKey = Get-ItemProperty -Path 'HKCU:\Software\Vivaldi'

if (!$regKey) {
    Write-Warning "Vivaldi looks to already be uninstalled."
} else {
    $packageArgs = @{
        packageName    = $packageName
        file           = "$($regKey.UninstallString)"
                              # Workaround to get around issue with incorrect positive from package validator
        silentArgs     = "$($($regKey.('Uninstall'+'Arguments')).Replace('--vivaldi','')) --force-uninstall --vivaldi-silent --do-not-launch-chrome"
        validExitCodes = @(0,19)
    }

    Uninstall-ChocolateyPackage @packageArgs
}