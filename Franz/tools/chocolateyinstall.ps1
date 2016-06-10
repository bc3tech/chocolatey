
$ErrorActionPreference = 'Stop';


$packageName= 'franz'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/imprecision/franz-app/releases/download/3.0.0/Franz-win32-ia32-3.0.0.zip'
$url64      = 'https://github.com/imprecision/franz-app/releases/download/3.0.0/Franz-win32-x64-3.0.0.zip'
$fileType = 'EXE'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  silentArgs   = '-s'

  softwareName  = 'franz*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}




$zipInstallDir = Install-ChocolateyZipPackage $packageName $url $toolsDir $url64




$fileInstallLocation = Join-Path $zipInstallDir 'FranzSetup.exe'
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs "$fileInstallLocation"











