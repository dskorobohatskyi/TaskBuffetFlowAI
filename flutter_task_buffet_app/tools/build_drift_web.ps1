$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $projectRoot

Set-Location $projectRoot

if (-not (Test-Path "web/drift_worker.dart")) {
  Write-Error "web/drift_worker.dart not found."
}

Write-Host "Compiling drift web worker..."
dart compile js web/drift_worker.dart -O2 -o web/drift_worker.js

Write-Host "Done."
