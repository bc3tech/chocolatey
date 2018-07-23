$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.55.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'CB8A8FA0ED7B15BC0A4C6D294FFE0B02B3D143C10A0AF5D003659C11B06EE390'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/stable/Vivaldi.1.15.1147.55.x64.exe'
    checksum64     = 'FCAE5CF1D0F2D85DDFE809D7463D1F9285B4367408422968FA5E7C473165EBD9'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs