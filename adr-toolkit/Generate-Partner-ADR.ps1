# Partner-Client ADR Generation Script
# Generates customized ADR documents for specific partner-client combinations
# This script can be called from any project directory and uses the central ADR toolkit

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("Accenture", "Acornsoft", "Avanade", "eLogic")]
    [string]$Partner,

    [Parameter(Mandatory=$true)]
    [ValidateSet("Ecolab", "Carter-Machinery", "Western-States")]
    [string]$Client,

    [Parameter(Mandatory=$true)]
    [string]$Title,

    [Parameter(Mandatory=$false)]
    [string]$OutputPath = (Join-Path $ProjectDirectory "Analysis\"),

    [Parameter(Mandatory=$false)]
    [switch]$GenerateAllFormats,

    [Parameter(Mandatory=$false)]
    [switch]$UseCustomTemplate,

    [Parameter(Mandatory=$false)]
    [string]$ProjectName = "",

    [Parameter(Mandatory=$false)]
    [ValidateSet("proposed", "accepted", "rejected", "deprecated", "superseded", "in-progress", "completed")]
    [string]$Status = "proposed",

    [Parameter(Mandatory=$false)]
    [string]$ProjectDirectory = $PWD.Path
)

# Get the toolkit directory (where this script is located)
$toolkitDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Configuration paths - check project directory first, then toolkit
# This allows projects to override templates while using toolkit as base
$projectPartnerConfig = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\config.json"
$toolkitPartnerConfig = Join-Path $toolkitDir "partners\$($Partner.ToLower())\config.json"
$partnerConfigPath = if (Test-Path $projectPartnerConfig) { $projectPartnerConfig } else { $toolkitPartnerConfig }

$projectClientConfig = Join-Path $ProjectDirectory "Analysis\clients\$($Client.ToLower().Replace('-', '-'))\config.json"
$toolkitClientConfig = Join-Path $toolkitDir "clients\$($Client.ToLower().Replace('-', '-'))\config.json"
$clientConfigPath = if (Test-Path $projectClientConfig) { $projectClientConfig } else { $toolkitClientConfig }

# Template paths - check project directory first, then toolkit
$projectPartnerTemplate = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\templates\adr-template.md"
$toolkitPartnerTemplate = Join-Path $toolkitDir "partners\$($Partner.ToLower())\templates\adr-template.md"
$partnerTemplatePath = if (Test-Path $projectPartnerTemplate) { $projectPartnerTemplate } else { $toolkitPartnerTemplate }

$projectClientTemplate = Join-Path $ProjectDirectory "Analysis\clients\$($Client.ToLower().Replace('-', '-'))\templates\adr-template.md"
$toolkitClientTemplate = Join-Path $toolkitDir "clients\$($Client.ToLower().Replace('-', '-'))\templates\adr-template.md"
$clientTemplatePath = if (Test-Path $projectClientTemplate) { $projectClientTemplate } else { $toolkitClientTemplate }

$projectBaseTemplate = Join-Path $ProjectDirectory "Analysis\ADR-Template.md"
$toolkitBaseTemplate = Join-Path $toolkitDir "ADR-Template.md"
$baseTemplatePath = if (Test-Path $projectBaseTemplate) { $projectBaseTemplate } else { $toolkitBaseTemplate }

# Function to load JSON configuration
function Get-Configuration {
    param([string]$Path)
    if (Test-Path $Path) {
        return Get-Content $Path | ConvertFrom-Json
    } else {
        Write-Warning "Configuration file not found: $Path"
        return $null
    }
}

# Function to merge templates
function Merge-Templates {
    param(
        [string]$BaseTemplate,
        [string]$PartnerTemplate,
        [string]$ClientTemplate,
        [object]$PartnerConfig,
        [object]$ClientConfig,
        [hashtable]$Replacements
    )

    # Start with partner template if it exists, otherwise base template
    $templatePath = if ($PartnerTemplate -and (Test-Path $PartnerTemplate)) {
        $PartnerTemplate
    } else {
        $BaseTemplate
    }

    $mergedTemplate = Get-Content $templatePath

    # Apply client customizations if client template exists
    if ($ClientTemplate -and (Test-Path $ClientTemplate)) {
        $clientContent = Get-Content $ClientTemplate
        # Merge client-specific sections into the partner template
        $mergedTemplate = Merge-ClientSections $mergedTemplate $clientContent $ClientConfig
    }

    # Apply replacements
    foreach ($key in $Replacements.Keys) {
        $mergedTemplate = $mergedTemplate -replace "\{$key\}", $Replacements[$key]
    }

    return $mergedTemplate
}

# Function to merge partner-specific sections
function Merge-PartnerSections {
    param([string[]]$BaseContent, [string[]]$PartnerContent, [object]$PartnerConfig)

    $result = $BaseContent

    # Add partner-specific sections
    if ($PartnerConfig.requiredSections) {
        foreach ($section in $PartnerConfig.requiredSections) {
            if ($section -notin @("context", "decision", "consequences")) {
                # Add section if not already present
                $sectionMarker = "## $(Get-SectionTitle $section)"
                if ($result -notcontains $sectionMarker) {
                    # Insert after Context section
                    $contextIndex = $result.IndexOf("## Context and Problem Statement")
                    if ($contextIndex -ge 0) {
                        $result = $result[0..$contextIndex] + $sectionMarker + "" + "{Content for $section}" + $result[($contextIndex + 1)..($result.Length - 1)]
                    }
                }
            }
        }
    }

    return $result
}

# Function to merge client-specific sections
function Merge-ClientSections {
    param([string[]]$BaseContent, [string[]]$ClientContent, [object]$ClientConfig)

    $result = $BaseContent

    # Add client-specific sections that don't already exist
    if ($ClientConfig.customSections) {
        foreach ($section in $ClientConfig.customSections) {
            $sectionTitle = Get-SectionTitle $section
            $sectionMarker = "## $sectionTitle"

            # Check if section already exists in base content
            $existingSection = $result | Where-Object { $_ -match "^## $sectionTitle$" }
            if (-not $existingSection) {
                # Find where to insert the section (after Consequences section)
                $insertIndex = -1
                for ($i = 0; $i -lt $result.Length; $i++) {
                    if ($result[$i] -match "^## Consequences$") {
                        $insertIndex = $i + 1
                        break
                    }
                }

                if ($insertIndex -ge 0) {
                    # Insert the section
                    $newSection = @($sectionMarker, "", "{Content for $section}", "")
                    $result = $result[0..$insertIndex] + $newSection + $result[($insertIndex + 1)..($result.Length - 1)]
                }
            }
        }
    }

    return $result
}

# Function to get section title from code
function Get-SectionTitle {
    param([string]$SectionCode)

    $titleMap = @{
        "executiveSummary" = "Executive Summary"
        "businessCase" = "Business Case"
        "technicalArchitecture" = "Technical Architecture"
        "riskAssessment" = "Risk Assessment"
        "implementationRoadmap" = "Implementation Roadmap"
        "stakeholderImpact" = "Stakeholder Impact"
        "regulatoryCompliance" = "Regulatory Compliance"
        "safetyStandards" = "Safety Standards"
        "environmentalImpact" = "Environmental Impact"
        "chemicalHandling" = "Chemical Handling"
        "globalStandards" = "Global Standards"
    }

    return $titleMap[$SectionCode] ?? $SectionCode
}

# Function to generate documents
function Generate-Document {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [string]$Format,
        [object]$PartnerConfig,
        [object]$ClientConfig,
        [string]$Partner,
        [string]$Client
    )

    $pandocArgs = @($InputPath, "-o", $OutputPath)

    # Add format-specific options
    switch ($Format) {
        "docx" {
            $pandocArgs += @("--toc", "--toc-depth=3", "--number-sections")

            # Always try to use reference document for DOCX formatting
            # Check project directory first, then toolkit
            $projectPartnerTemplateDoc = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\templates\$($Partner.ToLower())-template.docx"
            $toolkitPartnerTemplateDoc = Join-Path $toolkitDir "partners\$($Partner.ToLower())\templates\$($Partner.ToLower())-template.docx"
            $partnerTemplateDoc = if (Test-Path $projectPartnerTemplateDoc) { $projectPartnerTemplateDoc } else { $toolkitPartnerTemplateDoc }

            $projectClientTemplateDoc = Join-Path $ProjectDirectory "Analysis\clients\$($Client.ToLower().Replace('-', '-'))\templates\$($Client.ToLower().Replace('-', '-'))-template.docx"
            $toolkitClientTemplateDoc = Join-Path $toolkitDir "clients\$($Client.ToLower().Replace('-', '-'))\templates\$($Client.ToLower().Replace('-', '-'))-template.docx"
            $clientTemplateDoc = if (Test-Path $projectClientTemplateDoc) { $projectClientTemplateDoc } else { $toolkitClientTemplateDoc }

            # Priority: Client reference > Partner reference > Default formatting
            if ((Test-Path $clientTemplateDoc) -and ((Get-Item $clientTemplateDoc -Force -ErrorAction SilentlyContinue).Length -gt 0)) {
                $pandocArgs += "--reference-doc=$clientTemplateDoc"
                Write-Host "Using client reference template: $clientTemplateDoc" -ForegroundColor Blue
            } elseif ((Test-Path $partnerTemplateDoc) -and ((Get-Item $partnerTemplateDoc -Force -ErrorAction SilentlyContinue).Length -gt 0)) {
                $pandocArgs += "--reference-doc=$partnerTemplateDoc"
                Write-Host "Using partner reference template: $partnerTemplateDoc" -ForegroundColor Blue
            } else {
                Write-Host "No valid reference DOCX template found. Using default formatting." -ForegroundColor Yellow
                Write-Host "To customize formatting, add reference templates:" -ForegroundColor Yellow
                Write-Host "  - $clientTemplateDoc (client-specific formatting)" -ForegroundColor Yellow
                Write-Host "  - $partnerTemplateDoc (partner-specific formatting)" -ForegroundColor Yellow
            }

            # Additional DOCX formatting options
            $pandocArgs += @(
                "--syntax-highlighting=tango",
                "-V", "geometry:margin=1in",
                "-V", "fontsize=11pt",
                "-V", "fontfamily=arial"
            )
        }
        "html" {
            # Check project directory first, then toolkit
            $projectPartnerCss = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\styles\$($Partner.ToLower()).css"
            $toolkitPartnerCss = Join-Path $toolkitDir "partners\$($Partner.ToLower())\styles\$($Partner.ToLower()).css"
            $partnerCss = if (Test-Path $projectPartnerCss) { $projectPartnerCss } else { $toolkitPartnerCss }

            $projectDefaultCss = Join-Path $ProjectDirectory "Analysis\adr-styles.css"
            $toolkitDefaultCss = Join-Path $toolkitDir "adr-styles.css"
            $defaultCss = if (Test-Path $projectDefaultCss) { $projectDefaultCss } else { $toolkitDefaultCss }

            if (Test-Path $partnerCss) {
                $pandocArgs += @("--css=$partnerCss", "--embed-resources", "--standalone")
            } else {
                $pandocArgs += @("--css=$defaultCss", "--embed-resources", "--standalone")
            }
        }
        "pdf" {
            # Try different PDF engines in order of preference
            $pdfEngines = @("lualatex", "xelatex", "pdflatex")
            $engineFound = $false

            foreach ($engine in $pdfEngines) {
                if (Get-Command $engine -ErrorAction SilentlyContinue) {
                    $pandocArgs += @("--pdf-engine=$engine", "-V", "geometry:margin=1in", "--toc")
                    $engineFound = $true
                    break
                }
            }

            if (-not $engineFound) {
                Write-Warning "No PDF engine found (pdflatex, lualatex, or xelatex). PDF generation will be skipped."
                Write-Warning "To enable PDF generation, install a LaTeX distribution like MiKTeX or TeX Live."
                # Skip this format entirely
                return
            }
        }
    }

    & pandoc $pandocArgs

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully generated $Format document: $OutputPath" -ForegroundColor Green
    } else {
        Write-Host "Failed to generate $Format document" -ForegroundColor Red
    }
}

# Function to validate ADR content
function Test-ADRCompliance {
    param([string]$Content, [object]$PartnerConfig, [object]$ClientConfig)

    $issues = @()

    # Check partner required sections
    if ($PartnerConfig.requiredSections) {
        foreach ($section in $PartnerConfig.requiredSections) {
            $sectionTitle = Get-SectionTitle $section
            if ($Content -notmatch "## $sectionTitle") {
                $issues += "Missing required partner section: $sectionTitle"
            }
        }
    }

    # Check client required sections
    if ($ClientConfig.customSections) {
        foreach ($section in $ClientConfig.customSections) {
            $sectionTitle = Get-SectionTitle $section
            if ($Content -notmatch "## $sectionTitle") {
                $issues += "Missing required client section: $sectionTitle"
            }
        }
    }

    # Check for placeholder content
    if ($Content -match "\{.*\}") {
        $issues += "Template contains unreplaced placeholders"
    }

    return $issues
}

# Main script logic
Write-Host "Generating ADR for $Partner + $Client..." -ForegroundColor Cyan

# Load configurations
$partnerConfig = Get-Configuration $partnerConfigPath
$clientConfig = Get-Configuration $clientConfigPath

if (-not $partnerConfig) {
    Write-Error "Partner configuration not found for $Partner"
    exit 1
}

if (-not $clientConfig) {
    Write-Error "Client configuration not found for $Client"
    exit 1
}

# Generate ADR number (simple increment)
$adrNumber = Get-ChildItem (Join-Path $ProjectDirectory "Analysis\ADR-*.md") -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match "ADR-(\d+)-" } |
    ForEach-Object { [int]($matches[1]) } |
    Sort-Object -Descending |
    Select-Object -First 1
$adrNumber = ($adrNumber + 1) ?? 1

# Prepare replacements
$replacements = @{
    "NNN" = $adrNumber.ToString("000")
    "Title" = $Title
    "Client Name" = $Client.Replace("-", " ")
    "Partner Name" = $Partner
    "Engagement Name" = if ($ProjectName) { $ProjectName } else { "$Client $Title" }
    "Status" = $Status
    "Date" = Get-Date -Format "yyyy-MM-dd"
}

# Add partner-specific replacements
if ($partnerConfig.metadataFields) {
    foreach ($field in $partnerConfig.metadataFields) {
        $replacements[$field] = "{Enter $field}"
    }
}

# Add client-specific replacements
if ($clientConfig.requiredMetadata) {
    foreach ($field in $clientConfig.requiredMetadata) {
        $replacements[$field] = "{Enter $field}"
    }
}

# Generate merged template
$mergedTemplate = Merge-Templates `
    -BaseTemplate $baseTemplatePath `
    -PartnerTemplate $partnerTemplatePath `
    -ClientTemplate $clientTemplatePath `
    -PartnerConfig $partnerConfig `
    -ClientConfig $clientConfig `
    -Replacements $replacements

# Create output filename
$safeTitle = $Title -replace "[^a-zA-Z0-9]", "-"
$outputBaseName = "ADR-$($adrNumber.ToString('000'))-$safeTitle-$Partner-$Client"
if ($ProjectName) {
    $outputBaseName += "-$ProjectName"
}

# Validate content
$validationIssues = Test-ADRCompliance $mergedTemplate $partnerConfig $clientConfig
if ($validationIssues) {
    Write-Warning "ADR validation issues found:"
    $validationIssues | ForEach-Object { Write-Warning "  - $_" }
}

# Save merged template
$templateOutputPath = Join-Path $OutputPath "$outputBaseName.md"
$mergedTemplate | Out-File $templateOutputPath -Encoding UTF8
Write-Host "Generated ADR template: $templateOutputPath" -ForegroundColor Green

# Generate documents in requested formats
$formats = if ($GenerateAllFormats) {
    $partnerConfig.outputFormats
} else {
    @("docx")  # Default to DOCX
}

foreach ($format in $formats) {
    $outputFilePath = Join-Path $OutputPath "$outputBaseName.$format"

    Generate-Document `
        -InputPath $templateOutputPath `
        -OutputPath $outputFilePath `
        -Format $format `
        -PartnerConfig $partnerConfig `
        -ClientConfig $clientConfig `
        -Partner $Partner `
        -Client $Client
}

Write-Host "`nADR Generation Complete!" -ForegroundColor Green
Write-Host "Generated files:" -ForegroundColor Cyan
Get-ChildItem "$OutputPath\$outputBaseName.*" -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}

if ($validationIssues) {
    Write-Host "`nPlease review and address the validation issues listed above." -ForegroundColor Yellow
}

# Display usage summary
Write-Host "`nNext Steps:" -ForegroundColor Cyan
Write-Host "1. Edit the generated .md file with your specific content" -ForegroundColor White
Write-Host "2. Replace all {placeholder} text with actual values" -ForegroundColor White
Write-Host "3. Re-run generation to update output documents" -ForegroundColor White
Write-Host "4. Submit for partner/client approval as required" -ForegroundColor White