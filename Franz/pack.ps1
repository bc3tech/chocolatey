Param(
    # Version # of the build
    [Parameter(Mandatory = $true)]
    [string]
    $version,
    # download URL
    [Parameter(Mandatory = $true)]
    [string]
    $url,
    # SHA value
    [Parameter(Mandatory = $true)]
    [string]
    $sha,
    # output directory
    [Parameter()]
    [string]
    $outputdirectory = '.\')

$installFile = Get-ChildItem .\tools\chocolateyinstall.ps1

$content = Get-Content $installFile
$content = $content -replace [regex]::Escape('$url$'), $url
$content = $content -replace [regex]::Escape('$sha$'), $sha

Set-Content $installFile.PSPath -Value $content

choco pack --version $version --out $outputdirectory

Write-Host 'Uploaded. Check it out here: https://chocolatey.org/packages/Franz'