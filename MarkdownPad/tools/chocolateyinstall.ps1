$ErrorActionPreference = 'Stop';

$packageName= 'MarkdownPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://markdownpad.com/download/markdownpad2-portable.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'MarkdownPad*'
  checksum      = '609B59E3764608B45F8C5D77CD4CF288BB0EE70802A112E16A7DFA15D7464980'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs