$ErrorActionPreference = 'Stop';
$packageName= 'RealVNC'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.realvnc.com/download/file/vnc.files/VNC-5.3.2-Windows.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  softwareName  = 'RealVNC*'
  checksum      = '5A2AC32832F395B83AC6E9ECB18C71A34751C817'
  checksumType  = 'sha1'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs