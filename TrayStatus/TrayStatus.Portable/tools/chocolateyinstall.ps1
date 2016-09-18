$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'TrayStatus' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatus-3.1.zip' 
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
  checksum      = '568D161443892E3D31CBE34A3FE268E6'
  checksumType  = 'md5' #default is md5, can also be sha1
  checksum64    = '568D161443892E3D31CBE34A3FE268E6'
  checksumType64= 'md5' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs