
$ErrorActionPreference = 'Stop';


$packageName= 'TrayStatus.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatusSetup-4.2.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  softwareName  = 'TrayStatus.Install*'
  checksum      = '7F097662447388230EF59E7E901451EB639076AC4E05FCD72F4F8752C954D0FA'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs