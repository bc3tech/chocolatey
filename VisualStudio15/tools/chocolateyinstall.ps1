
$ErrorActionPreference = 'Stop';


$packageName= 'VisualStudio15'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/2/0/0/200fe227-bc0d-4dc5-b78d-15e70cc85e81/vs_bootstrapper.exe'
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
  checksum      = '82AC865C7987B0F9CF3F5E6BF5B17C659A951439'
  checksumType  = 'sha1'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs