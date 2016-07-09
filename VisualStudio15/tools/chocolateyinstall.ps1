
$ErrorActionPreference = 'Stop';


$packageName= 'VisualStudio15'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/e/e/6/ee6e936e-6323-4b51-a6f3-7b276b7e168a/vs_enterprise.exe'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  silentArgs	=	"/Q /L `"$($env:TEMP)\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" /norestart /passive /S"
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Microsoft Visual Studio Enterprise 15*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs