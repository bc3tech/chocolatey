$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$downloadedFile = Get-ChocolateyWebFile $packageName "$toolsDir\vivaldi-downloaded.zip" -Url 'https://downloads.vivaldi.com/stable/Vivaldi.1.3.551.38.exe' -Checksum '8BE15AD7D79F15347352C9929EBCFE695CA403AB' -ChecksumType 'SHA1' -Url64bit 'https://downloads.vivaldi.com/stable/Vivaldi.1.3.551.38.x64.exe' -Checksum64 '7667C36DF9CEC6F337CA4A338C9018ECE7F0C60A' -ChecksumType64 'SHA1'

Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"

Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null