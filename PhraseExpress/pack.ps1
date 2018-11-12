Param(
    # Version # of the build
    [Parameter(Mandatory = $true)]
    [string]
    $version,
    # MSI download URL
    [Parameter(Mandatory = $true)]
    [string]
    $msiurl,
    # MSI SHA value
    [Parameter(Mandatory = $true)]
    [string]
    $msisha,
    # ZIP download URL
    [Parameter(Mandatory = $true)]
    [string]
    $zipurl,
    # ZIP SHA256 value
    [Parameter(Mandatory = $true)]
    [string]
    $zipsha,
    # output directory
    [Parameter()]
    [string]
    $outputdirectory = '.\')

$chocoInstallFiles = Get-ChildItem . chocolateyinstall.ps1 -Recurse

foreach ($file in $chocoInstallFiles) {
    $content = Get-Content $file.PSPath
    $content = $content -replace [regex]::Escape('$msiurl$'), $msiurl
    $content = $content -replace [regex]::Escape('$zipurl$'), $zipurl
    $content = $content -replace [regex]::Escape('$msisha$'), $msisha
    $content = $content -replace [regex]::Escape('$zipsha$'), $zipsha

    Set-Content $file.PSPath -Value $content
}

choco pack .\PhraseExpress\phraseexpress.nuspec --version $version --out $outputdirectory
choco pack .\PhraseExpress.Install\phraseexpress.install.nuspec --version $version --out $outputdirectory
choco pack .\PhraseExpress.Portable\phraseexpress.portable.nuspec --version $version --out $outputdirectory