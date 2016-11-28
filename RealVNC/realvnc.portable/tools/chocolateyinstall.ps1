
$ErrorActionPreference = 'Stop';


$packageName= 'realvnc.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.realvnc.com/download/file/vnc.files/VNC-5.3.2-Windows.zip'
$url64      = $url

$checksum      = '8C5AA629DE020A812D9B68576CA3133AC4FCE113'
$checksumType  = 'sha1'

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType
