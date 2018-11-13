Param(
    # Version # of the build
    [Parameter(Mandatory = $true)]
    [string]
    $version,
    # 32-bit download URL
    [Parameter(Mandatory = $true)]
    [string]
    $url32,
    # 32-bit SHA value
    [Parameter(Mandatory = $true)]
    [string]
    $sha32,
    # 64-bit download URL
    [Parameter(Mandatory = $true)]
    [string]
    $url64,
    # 64-bit SHA256 value
    [Parameter(Mandatory = $true)]
    [string]
    $sha64,
    # output directory
    [Parameter()]
    [string]
    $outputdirectory = '.\')

$installFile = Get-ChildItem .\tools\chocolateyinstall.ps1

$content = Get-Content $installFile
$content = $content -replace [regex]::Escape('$32url$'), $url32
$content = $content -replace [regex]::Escape('$64url$'), $url64
$content = $content -replace [regex]::Escape('$32sha$'), $sha32
$content = $content -replace [regex]::Escape('$64sha$'), $sha64

Set-Content $installFile.PSPath -Value $content

choco pack --version $version --out $outputdirectory

Write-Host 'Uploaded. Check it out here: https://chocolatey.org/packages/vivaldi'