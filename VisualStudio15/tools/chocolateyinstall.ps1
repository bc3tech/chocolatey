
$ErrorActionPreference = 'Stop';


$packageName= 'VisualStudio15'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/7/e/9/7e931754-39ee-4bbf-9e31-12a193943c62/vs_enterprise.exe'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  silentArgs	=	"/Q /L `"$($env:TEMP)\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" /norestart /passive /S"
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'VisualStudio15*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs

















