param(
    [Parameter(Mandatory=$false)]
    [string]$Partner = "Accenture",

    [Parameter(Mandatory=$false)]
    [string]$Client = "Generic",

    [Parameter(Mandatory=$false)]
    [switch]$Force
)

Write-Host "ADR Toolkit Workspace Setup" -ForegroundColor Cyan
Write-Host "============================" -ForegroundColor Cyan

$workspaceRoot = Get-Location
$toolkitDir = Join-Path $workspaceRoot ".adr-toolkit"
$vscodeDir = Join-Path $workspaceRoot ".vscode"

# Get the source toolkit directory (assuming it's in the same directory as this script)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceToolkitDir = Join-Path $scriptDir "src\adr-toolkit"

# Validate partner and client exist in source toolkit
$partnerDir = Join-Path $sourceToolkitDir "partners\$($Partner.ToLower())"
$clientDir = Join-Path $sourceToolkitDir "clients\$($Client.ToLower().Replace(' ', '-').Replace('_', '-'))"

if (!(Test-Path $partnerDir)) {
    Write-Warning "Partner '$Partner' not found in toolkit. Available partners:"
    if (Test-Path (Join-Path $sourceToolkitDir "partners")) {
        Get-ChildItem (Join-Path $sourceToolkitDir "partners") -Directory | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Yellow }
    }
    Write-Host "Using default partner 'Accenture'" -ForegroundColor Blue
    $Partner = "Accenture"
}

if (!(Test-Path $clientDir)) {
    Write-Warning "Client '$Client' not found in toolkit. Available clients:"
    if (Test-Path (Join-Path $sourceToolkitDir "clients")) {
        Get-ChildItem (Join-Path $sourceToolkitDir "clients") -Directory | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Yellow }
    }
    Write-Host "Using default client 'Generic'" -ForegroundColor Blue
    $Client = "Generic"
}

# Check if toolkit already exists
if ((Test-Path $toolkitDir) -and -not $Force) {
    Write-Warning "ADR Toolkit already exists in this workspace."
    $overwrite = Read-Host "Overwrite existing toolkit? (y/N)"
    if ($overwrite -notmatch "^[Yy]$") {
        Write-Host "Setup cancelled." -ForegroundColor Yellow
        exit 0
    }
}

# Create directories
Write-Host "Creating directories..." -ForegroundColor Blue
New-Item -ItemType Directory -Path $toolkitDir -Force | Out-Null
New-Item -ItemType Directory -Path $vscodeDir -Force | Out-Null

# Copy toolkit files from source directory
if (Test-Path $sourceToolkitDir) {
    Write-Host "Copying toolkit files..." -ForegroundColor Blue
    Copy-Item "$sourceToolkitDir\*" $toolkitDir -Recurse -Force
} else {
    Write-Error "Source toolkit directory not found: $sourceToolkitDir"
    exit 1
}

# Update configuration for this workspace
$configPath = Join-Path $toolkitDir "config.json"
if (Test-Path $configPath) {
    Write-Host "Updating workspace configuration..." -ForegroundColor Blue
    $config = Get-Content $configPath | ConvertFrom-Json

    # Update project information
    $projectName = Split-Path $workspaceRoot -Leaf
    $config.project.name = $projectName
    $config.project.code = $projectName.ToLower().Replace(" ", "-").Replace("_", "-")

    # Update partner/client if specified
    if ($Partner -ne "Accenture") {
        $config.partner.name = $Partner
        $config.partner.code = $Partner.ToLower()
    }
    if ($Client -ne "Generic") {
        $config.client.name = $Client
        $config.client.code = $Client.ToLower().Replace(" ", "-").Replace("_", "-")
    }

    $config | ConvertTo-Json -Depth 10 | Set-Content $configPath
}

# Create VS Code tasks
$tasksPath = Join-Path $vscodeDir "tasks.json"
Write-Host "Creating VS Code tasks..." -ForegroundColor Blue
$tasksContent = @"
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Convert to $($Partner) DOCX",
            "type": "shell",
            "command": "pwsh",
            "args": [
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                ".adr-toolkit/Convert-ToAccentureDocx.ps1",
                "-InputFile",
                "`${file}",
                "-OpenAfterConversion"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            },
            "problemMatcher": []
        },
        {
            "label": "Generate ADR",
            "type": "shell",
            "command": "pwsh",
            "args": [
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                ".adr-toolkit/Generate-Partner-ADR.ps1",
                "-Partner",
                "$Partner",
                "-Client",
                "$Client",
                "-Type",
                "adf",
                "-Title",
                "`${input:title}",
                "-GenerateAllFormats",
                "-Status",
                "proposed"
            ],
            "group": "build",
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            },
            "problemMatcher": []
        }
    ],
    "inputs": [
        {
            "id": "title",
            "description": "Enter ADR title",
            "default": "",
            "type": "promptString"
        }
    ]
}
"@
$tasksContent | Set-Content $tasksPath

# Create batch file for command line usage
$batchPath = Join-Path $workspaceRoot "adr.bat"
Write-Host "Creating command-line helper..." -ForegroundColor Blue
$batchContent = @"
@echo off
REM ADR Toolkit Quick Commands
REM Usage: adr [command] [file]

if "%1"=="convert" goto convert
if "%1"=="generate" goto generate
if "%1"=="help" goto help

echo ADR Toolkit Quick Commands
echo Usage: adr [command] [options]
echo.
echo Commands:
echo   convert [file.md]    Convert markdown to DOCX
echo   generate [title]     Generate new ADR
echo   help                 Show this help
goto end

:convert
if "%2"=="" (
    echo Error: Please specify a markdown file to convert
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Convert-ToAccentureDocx.ps1" -InputFile "%2" -OpenAfterConversion
goto end

:generate
if "%2"=="" (
    echo Error: Please specify an ADR title
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Generate-Partner-ADR.ps1" -Partner $Partner -Client $Client -Type adf -Title "%2" -GenerateAllFormats -Status proposed
goto end

:help
echo ADR Toolkit Quick Commands
echo ==========================
echo.
echo Convert current file to DOCX:
echo   adr convert "path\to\file.md"
echo.
echo Generate new ADR:
echo   adr generate "ADR Title"
echo.
echo Available in VS Code:
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Convert to DOCX"
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Generate ADR"
goto end

:end
"@
$batchContent | Set-Content $batchPath

Write-Host "`nADR Toolkit Setup Complete!" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green
Write-Host "Partner: $Partner" -ForegroundColor White
Write-Host "Client: $Client" -ForegroundColor White
Write-Host "Workspace: $workspaceRoot" -ForegroundColor White
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Reload VS Code window (Ctrl+Shift+P → 'Developer: Reload Window')" -ForegroundColor White
Write-Host "2. Use Co-Pilot: 'Convert this markdown file to DOCX'" -ForegroundColor White
Write-Host "3. Or run: .\adr.bat help" -ForegroundColor White
Write-Host ""
Write-Host "VS Code Tasks Available:" -ForegroundColor Cyan
Write-Host "- 'Convert to $($Partner) DOCX' - Convert current file" -ForegroundColor White
Write-Host "- 'Generate ADR' - Create new ADR" -ForegroundColor White