$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'TrayStatus' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatus-4.5.zip' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'TrayStatus*' 
  checksum      = '69C4078DDC7D64223F368F2BC86477D6A8E74E7C9B133A5A5614E7A468334570'
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyZipPackage @packageArgs
