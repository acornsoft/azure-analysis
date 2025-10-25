# ADR Project Setup Script
# Establishes the standardized Analysis/Partner folder structure for ADR management
# Run this script in any .NET project directory to set up ADR infrastructure

param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectDirectory = (Get-Location).Path,

    [Parameter(Mandatory=$false)]
    [string[]]$Partners = @("Accenture", "Acornsoft", "Avanade", "eLogic"),

    [Parameter(Mandatory=$false)]
    [switch]$Force
)

# Function to find .csproj files and determine project structure
function Get-ProjectInfo {
    param([string]$Path)

    $csprojFiles = Get-ChildItem -Path $Path -Filter "*.csproj" -Recurse -ErrorAction SilentlyContinue

    if ($csprojFiles.Count -eq 0) {
        Write-Warning "No .csproj files found in $Path"
        return $null
    }

    # Use the first .csproj found as the main project
    $mainCsproj = $csprojFiles[0]
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($mainCsproj.Name)
    $projectRoot = [System.IO.Path]::GetDirectoryName($mainCsproj.FullName)

    return @{
        Name = $projectName
        Root = $projectRoot
        CsprojPath = $mainCsproj.FullName
    }
}

# Function to create standardized folder structure
function New-AdrStructure {
    param(
        [string]$ProjectRoot,
        [string[]]$PartnerList
    )

    $analysisPath = Join-Path $ProjectRoot "Analysis"
    $partnerPath = Join-Path $analysisPath "Partner"

    # Create base directories
    $directories = @($analysisPath, $partnerPath)

    foreach ($partner in $PartnerList) {
        $partnerSubPath = Join-Path $partnerPath $partner
        $directories += $partnerSubPath
    }

    foreach ($dir in $directories) {
        if (!(Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Host "Created directory: $dir" -ForegroundColor Green
        } else {
            Write-Host "Directory already exists: $dir" -ForegroundColor Blue
        }
    }

    # Create shared images folder
    $imagesPath = Join-Path $analysisPath "images"
    if (!(Test-Path $imagesPath)) {
        New-Item -ItemType Directory -Path $imagesPath -Force | Out-Null
        Write-Host "Created shared images directory: $imagesPath" -ForegroundColor Green
    }

    return @{
        AnalysisPath = $analysisPath
        PartnerPath = $partnerPath
        ImagesPath = $imagesPath
    }
}

# Function to create generation scripts
function New-GenerationScripts {
    param(
        [string]$ProjectRoot,
        [hashtable]$Structure,
        [string[]]$PartnerList
    )

    $scriptsPath = Join-Path $Structure.PartnerPath "scripts"
    if (!(Test-Path $scriptsPath)) {
        New-Item -ItemType Directory -Path $scriptsPath -Force | Out-Null
    }

    # Create multi-partner generation script
    $generateAllScript = @"
# Multi-Partner ADR Generation Script
# Generates ADR documents for all configured partners from shared Markdown source

param(
    [Parameter(Mandatory=`$true)]
    [string]`$MarkdownFile,

    [Parameter(Mandatory=`$false)]
    [string[]]`$Partners = @("$($PartnerList -join '", "')"),

    [Parameter(Mandatory=`$false)]
    [string]`$ProjectDirectory = "$ProjectRoot",

    [Parameter(Mandatory=`$false)]
    [switch]`$GenerateAllFormats
)

# Get toolkit directory
`$toolkitDir = "$((Get-Location).Drive.Name):\Users\$env:USERNAME\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit"

foreach (`$partner in `$Partners) {
    Write-Host "Generating documents for `$partner..." -ForegroundColor Cyan

    `$partnerPath = Join-Path "$($Structure.PartnerPath)" `$partner

    # Ensure partner directory exists
    if (!(Test-Path `$partnerPath)) {
        New-Item -ItemType Directory -Path `$partnerPath -Force | Out-Null
    }

    # Generate DOCX
    `$docxOutput = Join-Path `$partnerPath ([System.IO.Path]::GetFileNameWithoutExtension(`$MarkdownFile) + ".docx")
    `$partnerTemplate = Join-Path `$toolkitDir "partners\`$($partner.ToLower())\templates\`$($partner.ToLower())-template.docx"

    if (Test-Path `$partnerTemplate) {
        & pandoc `$MarkdownFile -o `$docxOutput --reference-doc=`$partnerTemplate --toc --toc-depth=3
        if (`$LASTEXITCODE -eq 0) {
            Write-Host "Generated DOCX: `$docxOutput" -ForegroundColor Green
        }
    } else {
        Write-Warning "Partner template not found: `$partnerTemplate"
    }

    # Generate other formats if requested
    if (`$GenerateAllFormats) {
        # HTML
        `$htmlOutput = Join-Path `$partnerPath ([System.IO.Path]::GetFileNameWithoutExtension(`$MarkdownFile) + ".html")
        & pandoc `$MarkdownFile -o `$htmlOutput --embed-resources --standalone --toc

        # PDF (if LaTeX available)
        `$pdfOutput = Join-Path `$partnerPath ([System.IO.Path]::GetFileNameWithoutExtension(`$MarkdownFile) + ".pdf")
        if (Get-Command pdflatex -ErrorAction SilentlyContinue) {
            & pandoc `$MarkdownFile -o `$pdfOutput --pdf-engine=pdflatex --toc
        }
    }
}

Write-Host "Multi-partner generation complete!" -ForegroundColor Green
"@

    $generateAllScriptPath = Join-Path $scriptsPath "Generate-All-Partner-ADRs.ps1"
    $generateAllScript | Out-File $generateAllScriptPath -Encoding UTF8
    Write-Host "Created generation script: $generateAllScriptPath" -ForegroundColor Green

    # Create README for the structure
    $readmeContent = @"
# ADR Management Structure

This project uses a standardized ADR (Architecture Decision Record) management structure.

## Folder Structure

```
Analysis/
├── Partner/                    # Shared Markdown sources and partner-specific outputs
│   ├── [PartnerName]/         # Partner-specific generated documents
│   │   ├── ADR-*.docx        # Partner-branded Word documents
│   │   ├── ADR-*.html        # HTML versions
│   │   └── ADR-*.pdf         # PDF versions
│   ├── ADR-*.md              # Shared Markdown source files
│   └── scripts/              # Generation and utility scripts
│       └── Generate-All-Partner-ADRs.ps1
└── images/                   # Shared images and diagrams
```

## Usage

### Creating New ADRs

1. Place Markdown source files in `Analysis/Partner/`
2. Run the generation script to create partner-specific documents:

```powershell
.\scripts\Generate-All-Partner-ADRs.ps1 -MarkdownFile "Analysis\Partner\ADR-Example.md"
```

### Supported Partners

$($PartnerList | ForEach-Object { "- $_" } | Out-String)

### File Naming Convention

- Markdown sources: `ADR-Title.md`
- Generated files: `ADR-Title-[Partner].docx`

## Requirements

- Pandoc (for document generation)
- Partner-specific templates in toolkit
- PowerShell 5.1+

## Toolkit Integration

This structure integrates with the centralized ADR toolkit located at:
`$((Get-Location).Drive.Name):\Users\$env:USERNAME\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit`

Templates and configurations are automatically discovered from the toolkit.
"@

    $readmePath = Join-Path $Structure.PartnerPath "README.md"
    $readmeContent | Out-File $readmePath -Encoding UTF8
    Write-Host "Created README: $readmePath" -ForegroundColor Green
}

# Main script execution
Write-Host "ADR Project Setup" -ForegroundColor Cyan
Write-Host "=================" -ForegroundColor Cyan

# Discover project information
$projectInfo = Get-ProjectInfo -Path $ProjectDirectory

if (-not $projectInfo) {
    Write-Error "Could not determine project information. Ensure you're in a .NET project directory with .csproj files."
    exit 1
}

Write-Host "Project discovered:" -ForegroundColor Blue
Write-Host "  Name: $($projectInfo.Name)" -ForegroundColor White
Write-Host "  Root: $($projectInfo.Root)" -ForegroundColor White
Write-Host "  Csproj: $($projectInfo.CsprojPath)" -ForegroundColor White

# Confirm setup
if (-not $Force) {
    $confirmation = Read-Host "`nSet up ADR structure for this project? (Y/n)"
    if ($confirmation -ne 'y' -and $confirmation -ne 'Y' -and $confirmation -ne '') {
        Write-Host "Setup cancelled." -ForegroundColor Yellow
        exit 0
    }
}

# Create folder structure
$structure = New-AdrStructure -ProjectRoot $projectInfo.Root -PartnerList $Partners

# Create generation scripts and documentation
New-GenerationScripts -ProjectRoot $projectInfo.Root -Structure $structure -PartnerList $Partners

Write-Host "`nADR structure setup complete!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "1. Place ADR Markdown files in $($structure.PartnerPath)" -ForegroundColor White
Write-Host "2. Run .\scripts\Generate-All-Partner-ADRs.ps1 to generate documents" -ForegroundColor White
Write-Host "3. Review README.md in $($structure.PartnerPath) for detailed usage" -ForegroundColor White

# Display created structure
Write-Host "`nCreated structure:" -ForegroundColor Cyan
Get-ChildItem -Path $structure.AnalysisPath -Recurse -Directory | ForEach-Object {
    $relativePath = $_.FullName.Replace("$($projectInfo.Root)\", "")
    Write-Host "  $relativePath/" -ForegroundColor White
}</content>
<parameter name="filePath">C:\Users\david.blaszyk\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit\Setup-Adr-Structure.ps1