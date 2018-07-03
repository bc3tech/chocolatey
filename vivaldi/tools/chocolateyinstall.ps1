$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.52.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '7AF0506A3002FA2245BC6A5E5CA039FC3B954D6A321060A769574A31FC40C708'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.52.x64.exe'
    checksum64     = 'CE8DBA2F47A67FB6002804DDEEE7A22DAB47DB0053464AFAD7A83B34D0B3B0DB'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs