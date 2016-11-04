$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName  = 'wordpress'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'wordpress-com-1-9-0-setup.exe'

#Based on Nsis
$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'wordpress*'
  file          = $fileLocation
  fileFullPath  = $fileLocation
  fileType      = 'exe'
  silentArgs    = "/S"
  validExitCodes= @(0)
  destination   = $toolsDir
  
  url           = ''
  checksum      = 'DD4AF86340FE3D54D75244D51EC35B3EE7D8D9DA5C41E5E0405BBA646B17D9ED'
  checksumType  = 'sha256'
  url64bit      = '' 
  checksum64    = ''
  checksumType64= 'sha256'
}

Install-ChocolateyInstallPackage @packageArgs 
