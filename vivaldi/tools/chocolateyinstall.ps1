$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.13.1008.44.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '45788DBF83C6E280AE295F59A3923C86DB49604ED7A784723B5EA28F8BC34293'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.13.1008.44.x64.exe'
    checksum64     = 'EEB1D3653DC4EE28E7EC09F935890CF1F0B7A05419E84A6C484E68BB445E1D52'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs