$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.14.1077.41.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'B42438286EEA1BEB9D12575CDEE53FA66EF8580B110174065B7C7F2069C25476'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.14.1077.41.x64.exe'
    checksum64     = 'C2BD681EF0BC8A952546717F324ADD24DFBDF35AE085D06FB5FDEF89336B914C'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs