$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://stompsoftware.com/downloadfiles/albumstomp/SetupAlbumStompV2.exe' 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe' 
    url            = $url

    softwareName   = 'AlbumStomp*' 

    checksum       = '350C4580BE69F988FB2A8871A9F71F0262288F9D0643CA7441AB7829BC98A4B4'
    checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512

    # validExitCodes= @(0, 3010, 1641)
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
    validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs 
