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
 
 $csprojPath = "$pwd/src/DoggoApp/DoggoApp.csproj"
$xml = New-Object XML
$xml.PreserveWhitespace = $true
$xml.Load($csprojPath)
$xml.Project.PropertyGroup.Version = $newVersion
$xml.Save($csprojPath)

Write-Host "Version updated in all files"

# Git commit version bump
Write-Host "Committing new version"
git add VERSION $csprojPath
git commit -m "Release v$newVersion"
git push origin HEAD
git tag $newVersion
git push origin $newVersion