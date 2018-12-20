$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'

$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'

    url            = '$32url$'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '$32sha$'
    checksumType   = 'sha256'
    url64bit       = '$64url$'
    checksum64     = '$64sha$'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs