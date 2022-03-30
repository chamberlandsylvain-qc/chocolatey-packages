$ErrorActionPreference = 'Stop';
$packageName   = $env:ChocolateyPackageName
$pathToUninstall = "$env:LOCALAPPDATA\Programs\Amazon\AWSCLIV2"

Write-Host "Removing $packageName..."
if (Test-Path -Path $pathToUninstall) {
  Remove-Item $pathToUninstall -Recurse
  Write-Host "Removed files in '$pathToUninstall'"
}