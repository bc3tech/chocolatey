$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.42.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '336843AE7EC4DA7F61B8B2398E6BADD205BF74ADD0030DABBA574B6BBB23F8B0'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.42.x64.exe'
    checksum64     = '52A1BCAA686618C2DA649DA77C13175F832158947D5E7F696A7FED98D1E6AE59'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs