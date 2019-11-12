# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'onetastic' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getonetastic.com/downloadFile&fv=0&file=OnetasticInstaller.x86.zip&agree=1&download=' # download url
$url64      = 'https://getonetastic.com/downloadFile&fv=0&file=OnetasticInstaller.x64.zip&agree=1&download='

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64

## Installer, will assert administrative rights - used by Install-ChocolateyPackage
## use this for embedding installers in the package when not going to community feed or when you have distribution rights
## - https://chocolatey.org/docs/helpers-install-chocolatey-install-package
$fileLocation = Join-Path $toolsDir 'OnetasticInstaller.x86.exe'
$fileLocation64 = Join-Path $toolsDir 'OnetasticInstaller.x64.exe'

$configLocation = Join-Path $toolsDir 'config.xml'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file          = $fileLocation
  file64        = $fileLocation64
  silentArgs    = "/config $($configLocation)"
  validExitCodes= @(0)
  softwareName  = 'Onetastic*'
}

Install-ChocolateyInstallPackage @packageArgs