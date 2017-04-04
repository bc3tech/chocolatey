$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/stable/Vivaldi.1.8.770.54.exe'
  checksum      = '5FCFB2F8922390B74503EC32E2FAA5430FE042AFF78F89E844934A798E3E7948'
  checksumType  = 'sha256' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/stable/Vivaldi.1.8.770.54.x64.exe'
  checksum64    = '63A201A86A4D9B2770ACC86BB3C1B3E4FA4CEB3C6DEC9757187256EB63ABDD74'
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