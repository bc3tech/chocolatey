$ErrorActionPreference = 'Stop';

$packageName= 'MultilingualAppToolkit'

$packageArgs = @{
    packageName    = $packageName
    fileType       = 'msi'

    url            = 'http://download.microsoft.com/download/3/2/4/324B517B-F5A3-480A-AAE0-DDB522358E96/MultilingualAppToolkit.msi'
    silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
    validExitCodes= @(0, 3010, 1641)
  
    checksum       = 'BD088949AAEA3DA4B56FA176F2FB4844637D88B038704DC081DD607374FDFF44'
    checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
