param(
    [string]$SourcePath = "src/adr-toolkit",
    [string[]]$TargetPaths = @(".adr-toolkit", "../.adr-toolkit"),
    [switch]$Force
)

Write-Host "Syncing ADR template files from $SourcePath to target locations..."

# Get all template files from source
$templateFiles = Get-ChildItem -Path $SourcePath -Filter "*-template.docx" -Recurse

if ($templateFiles.Count -eq 0) {
    Write-Host "No template files found in $SourcePath"
    return
}

foreach ($targetPath in $TargetPaths) {
    Write-Host "`nSyncing to: $targetPath"

    if (!(Test-Path $targetPath)) {
        Write-Host "Target path $targetPath does not exist, skipping..."
        continue
    }

    $copiedCount = 0
    $skippedCount = 0

    foreach ($sourceFile in $templateFiles) {
        # Calculate relative path from source
        $relativePath = $sourceFile.FullName.Substring((Resolve-Path $SourcePath).Path.Length + 1)

        # Construct target path
        $targetFile = Join-Path $targetPath $relativePath

        # Ensure target directory exists
        $targetDir = Split-Path $targetFile -Parent
        if (!(Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }

        # Copy file if needed
        if ($Force -or !(Test-Path $targetFile) -or ((Get-Item $sourceFile).LastWriteTime -gt (Get-Item $targetFile).LastWriteTime)) {
            Copy-Item -Path $sourceFile.FullName -Destination $targetFile -Force
            Write-Host "  Copied: $relativePath"
            $copiedCount++
        } else {
            Write-Host "  Skipped (up to date): $relativePath"
            $skippedCount++
        }
    }

    Write-Host "  Summary: $copiedCount copied, $skippedCount skipped"
}

Write-Host "`nTemplate sync complete."