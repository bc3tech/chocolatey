$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.36.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '88073FDC6E62291D834F249D43666F4641D7AE4EFECEA05AF053CCFAFC3DAAF2'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.36.x64.exe'
    checksum64     = 'B76AA448CBE3A272EAB91687291155843AD01DF8379AB41AEE1B37CB9F1C7B09'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs