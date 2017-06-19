$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/stable/Vivaldi.1.10.867.38.exe'
    checksum     = 'C3BCE885A284DC362A81CB0D03780CBA7EBC434B3D495628C31EF9B3F718FE44'
  checksumType  = 'sha256' #default is md5, can also be sha1
 
    url64bit     = 'https://downloads.vivaldi.com/stable/Vivaldi.1.10.867.38.x64.exe'
    checksum64   = 'FBF08C6D1FEB28755576837AC9FD8C0B126F5D0FE31C8F3792115C66806B6C7B'
  checksumType64= 'sha256' #default is checksumType
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\update_notifier.exe.ignore" -type file -force | Out-Null