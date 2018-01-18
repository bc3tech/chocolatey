
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.phraseexpress.com/PhraseExpressSetup.msi' 
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PhraseExpress*'
  checksum      = '5098643739D2FC02DA5AE09588853DA2471B5331D2B75B51C1E870BD33A0EF72'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs