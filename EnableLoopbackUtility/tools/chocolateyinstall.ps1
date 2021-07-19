$ErrorActionPreference = 'Stop';


$packageName= 'EnableLoopbackUtility'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://telerik-fiddler.s3.amazonaws.com/fiddler/addons/enableloopbackutility.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'

  softwareName  = 'EnableLoopbackUtility*'
  checksum      = '26945F5744E1C2965F5D8B556477C7C9D7100C00DE125DB461F7328EACB57C60'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
