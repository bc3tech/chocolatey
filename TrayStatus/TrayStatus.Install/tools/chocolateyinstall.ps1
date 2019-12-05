
$ErrorActionPreference = 'Stop';


$packageName= 'TrayStatus.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatusSetup-4.1.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  softwareName  = 'TrayStatus.Install*'
  checksum      = '92A7A21E25BB041D9299B91CEAB2783F636224303CBF36DC48CE125E0B6F88B9'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs