# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'realvnc.portable' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.realvnc.com/download/file/vnc.files/VNC-5.3.2-Windows.zip' # download url
$url64      = $url # 64bit URL here or remove - if installer contains both (very rare), use $url
#$fileLocation = Join-Path $toolsDir 'NAME_OF_EMBEDDED_INSTALLER_FILE'
#$fileLocation = '\\SHARE_LOCATION\to\INSTALLER_FILE'

$checksum      = '8C5AA629DE020A812D9B68576CA3133AC4FCE113'
$checksumType  = 'sha1' #default is md5, can also be sha1, sha256 or sha512

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType