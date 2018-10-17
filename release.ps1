# Get current version
$currentVersion = Get-Content VERSION

if ([String]::IsNullOrWhiteSpace($currentVersion)) {
	Write-Host "Current version not found." -ForegroundColor Red
	exit 1
}

$versionParts = $currentVersion.TrimEnd("*-").Split(".")
$currentMajor = [Convert]::ToInt32($versionParts[0])
$currentMinor = [Convert]::ToInt32($versionParts[1])
$currentPatch = [Convert]::ToInt32($versionParts[2])

Write-Host "Current version: $currentMajor.$currentMinor.$currentPatch" -ForegroundColor Yellow

# Bump version
Write-Host "Which part of the version to bump (major|minor|patch)?"

$toBump = Read-Host

if ($toBump -eq "major") {
	$currentMajor++
	$currentMinor = 0
	$currentPatch = 0
}
elseif ($toBump -eq "minor") {
	$currentMinor++
	$currentPatch = 0
}
elseif($toBump -eq "patch") {
	$currentPatch++
}

$newVersion = "$currentMajor.$currentMinor.$currentPatch";

Write-Host "New version: $newVersion"

# Update files
$newVersion | Out-File -encoding ascii VERSION -NoNewline