$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/stable/Vivaldi.1.7.735.46.exe'
  checksum      = '1E78BFC340412158D78240CF68204E26C6464F64'
  checksumType  = 'sha1' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/stable/Vivaldi.1.7.735.46.x64.exe'
  checksum64    = '8E988F978DAB46B4BB154AC8AE0090A3F4D068D6'
  checksumType64= 'sha1' #default is checksumType
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null