$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName   = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$url64        = "https://awscli.amazonaws.com/AWSCLIV2-$packageVersion.msi"
$installLocation = "$env:LOCALAPPDATA\Programs"
$msiFilePath = "$installLocation\AWSCLIV2-$packageVersion.msi"
$pathToInstall = "$installLocation\Amazon\AWSCLIV2"
$silentArgs = "/a $url64 /quiet /qn TARGETDIR=$installLocation /l*v `"$($env:TEMP)\$($packageName).$($packageVersion).MsiInstall.log`""

Write-Host "$packageName $packageVersion is downloading and installing..."
Start-Process "msiexec" -ArgumentList $silentArgs -Wait
# msiexec leaves the .msi in %LocalAppData%\Programs

if (Test-Path -Path $msiFilePath) {
  Remove-Item $msiFilePath  
}

Install-ChocolateyPath $pathToInstall 'User'
Update-SessionEnvironment