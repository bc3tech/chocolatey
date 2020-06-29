
$ErrorActionPreference = 'Stop';


$packageName= 'TrayStatus.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatusSetup-4.3.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  softwareName  = 'TrayStatus.Install*'
  checksum      = 'F32214AD8E8B4C7D21BC29EC7F472E0167CDBABADFDD1807B359D3E4CEA9080F'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
