$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

	$downloadedFile = Get-ChocolateyWebFile $packageName "$toolsDir\vivaldi-downloaded.zip" 'https://downloads.vivaldi.com/stable/Vivaldi.1.2.490.39.exe'

	7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
	Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"