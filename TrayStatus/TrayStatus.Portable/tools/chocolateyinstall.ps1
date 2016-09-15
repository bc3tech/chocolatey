$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'TrayStatus' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatus-3.0.zip' 
$url64      = $url
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'TrayStatus*' 
  checksum      = '187875FDBAA1A664AB255D89B6293F50'
  checksumType  = 'md5' #default is md5, can also be sha1
  checksum64    = '187875FDBAA1A664AB255D89B6293F50'
  checksumType64= 'md5' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs