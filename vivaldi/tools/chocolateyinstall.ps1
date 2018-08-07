$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.64.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '937B924D73D615DA39C3A38602180312C5D43FF03E912CC8F531C28BD580469A'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.64.x64.exe'
    checksum64     = '125AF5AA2E75A0D4F034BC6B4927E77A9C3505C0D308C578B3F0D04972865B13'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs