$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$downloadedFile = Get-ChocolateyWebFile $packageName "$toolsDir\vivaldi-downloaded.zip" -Url 'https://downloads.vivaldi.com/stable/Vivaldi.1.4.589.11.exe' -Checksum '4F23B2294D4E1D98C3BA993C863D159A5FC03B08' -ChecksumType 'SHA1' -Url64bit 'https://downloads.vivaldi.com/stable/Vivaldi.1.4.589.11.x64.exe' -Checksum64 'F8588FA0C26EDA9FFE75AE134B4A9C91E4E25F9A' -ChecksumType64 'SHA1'

Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"

Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null