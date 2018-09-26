$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable-auto/Vivaldi.2.0.1309.29.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'E35A96F798000D9817E7A1340B9ED8546B2413AB4B780886D4222BE16521DF59'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable-auto/Vivaldi.2.0.1309.29.x64.exe'
    checksum64     = '02462BB43379A866F23152791ED40CA99FB303E1E7A83B70B357D25E9587163D'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs