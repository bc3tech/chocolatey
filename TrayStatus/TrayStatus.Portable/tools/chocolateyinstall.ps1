$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'TrayStatus' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatus-4.2.zip' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'TrayStatus*' 
  checksum      = '08ABD8A288112AF777CC2DFA5C26820D092959140515D8E8504A980A1C5C43CC'
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyZipPackage @packageArgs