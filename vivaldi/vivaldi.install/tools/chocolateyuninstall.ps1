$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'

# Despite being 64bit, Vivaldi still uses this registry key
$regKey = Get-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Vivaldi'

if (!$regKey) {
    Write-Warning "Vivaldi looks to already be uninstalled"
} else {
    $packageArgs = @{
        packageName    = $packageName
        file           = "$($regKey.UninstallString)"
                              # Workaround to get around issue with incorrect positive from package validator
        silentArgs     = "$($($regKey.('Uninstall'+'Arguments')).Replace('--vivaldi','')) --uninstall --force-uninstall --system-level --vivaldi-silent"
        validExitCodes = @(0,19)
    }

    Uninstall-ChocolateyPackage @packageArgs
}
