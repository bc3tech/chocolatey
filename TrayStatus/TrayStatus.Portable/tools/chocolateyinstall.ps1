$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'TrayStatus' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatus-4.4.zip' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'TrayStatus*' 
  checksum      = '3BC5321FF4B691E7ED4679E074DC049D2D2A8FC524E3FD7F49A6D738F8CB8A15'
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyZipPackage @packageArgs
