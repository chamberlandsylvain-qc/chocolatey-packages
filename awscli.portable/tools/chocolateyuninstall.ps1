$ErrorActionPreference = 'Stop';

$pathToUninstall = "$env:LOCALAPPDATA\Programs\Amazon\AWSCLIV2"

# package removal done in chocolateyBeforeModify.ps1
$userPath = [System.Collections.ArrayList]([System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User) `
  -split ';')
if ($userPath.Contains($pathToUninstall)) {
  $userPath.Remove($pathToUninstall)
}
$newUserPath = $userPath -join ';'
[System.Environment]::SetEnvironmentVariable('PATH', $newUserPath, [System.EnvironmentVariableTarget]::User)
Write-Host "Removed '$pathToUninstall' from User PATH"
Update-SessionEnvironment