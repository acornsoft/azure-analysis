# Partner-Client ADR Generation Script
# Generates customized ADR documents for specific partner-client combinations
# This script can be called from any project directory and uses the central ADR toolkit
# Automatically creates the required Analysis/Partner structure if it doesn't exist

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("Accenture", "Acornsoft", "Avanade", "eLogic")]
    [string]$Partner,

    [Parameter(Mandatory=$true)]
    [ValidateSet("Ecolab", "Carter-Machinery", "Western-States")]
    [string]$Client,

    [Parameter(Mandatory=$true)]
    [ValidateSet("standard", "adf", "func", "apim", "kv", "logic", "sbns", "sbq", "sbt", "sbts", "aa", "appi", "ag", "dcr", "log", "mg", "rg", "app", "asp", "vm", "vmss", "stapp")]
    [string[]]$Type,

    [Parameter(Mandatory=$true)]
    [string]$Title,

    [Parameter(Mandatory=$false)]
    [string]$OutputPath,

    [Parameter(Mandatory=$false)]
    [switch]$GenerateAllFormats,

    [Parameter(Mandatory=$false)]
    [ValidateSet("requirements", "overview", "deep-dive")]
    [string]$Flavor,

    [Parameter(Mandatory=$false)]
    [string]$ProjectName = "",

    [Parameter(Mandatory=$false)]
    [ValidateSet("proposed", "accepted", "rejected", "deprecated", "superseded", "in-progress", "completed")]
    [string]$Status = "proposed",

    [Parameter(Mandatory=$false)]
    [string]$ProjectDirectory = (Get-Location).Path,

    [Parameter(Mandatory=$false)]
    [string]$TargetFolder = "",

    [Parameter(Mandatory=$false)]
    [switch]$GenerateDiagrams,

    [Parameter(Mandatory=$false)]
    [string[]]$DiagramTemplates,

    [Parameter(Mandatory=$false)]
    [string]$ImagesFolder = "images",

    [Parameter(Mandatory=$false)]
    [switch]$SkipStructureSetup
)

# Adjust ProjectDirectory if TargetFolder is specified
if ($TargetFolder) {
    $ProjectDirectory = Join-Path $ProjectDirectory $TargetFolder
}

# Set default OutputPath - Markdown goes to Analysis/Partner, generated docs to Analysis/Partner/[Partner]
if (-not $OutputPath) {
    $OutputPath = Join-Path $ProjectDirectory "Analysis\Partner\$Partner"
}

# Get the toolkit directory (where this script is located)
$toolkitDir = Split-Path -Parent $MyInvocation.MyCommand.Path

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

# Configuration paths - check project directory first, then toolkit
# This allows projects to override templates while using toolkit as base
$projectPartnerConfig = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\config.json"
$toolkitPartnerConfig = Join-Path $toolkitDir "partners\$($Partner.ToLower())\config.json"
$partnerConfigPath = if (Test-Path $projectPartnerConfig) { $projectPartnerConfig } else { $toolkitPartnerConfig }

$projectClientConfig = Join-Path $ProjectDirectory "Analysis\clients\$($Client.ToLower().Replace('-', '-'))\config.json"
$toolkitClientConfig = Join-Path $toolkitDir "clients\$($Client.ToLower().Replace('-', '-'))\config.json"
$clientConfigPath = if (Test-Path $projectClientConfig) { $projectClientConfig } else { $toolkitClientConfig }

# Template paths - check project directory first, then toolkit
$adrTypeTemplatePaths = @()
foreach ($type in $Type) {
    $flavorPath = if ($Flavor) { "/$Flavor" } else { "" }
    $projectAdrTypeTemplate = Join-Path $ProjectDirectory "Analysis\types\$type$flavorPath\template.md"
    $toolkitAdrTypeTemplate = Join-Path $toolkitDir "types\$type$flavorPath\template.md"
    $adrTypeTemplatePath = if (Test-Path $projectAdrTypeTemplate) { $projectAdrTypeTemplate } else { $toolkitAdrTypeTemplate }
    $adrTypeTemplatePaths += $adrTypeTemplatePath
}

$projectPartnerTemplate = Join-Path $ProjectDirectory "Analysis\partners\$($Partner.ToLower())\templates\adr-template.md"
$toolkitPartnerTemplate = Join-Path $toolkitDir "partners\$($Partner.ToLower())\templates\adr-template.md"
$partnerTemplatePath = if (Test-Path $projectPartnerTemplate) { $projectPartnerTemplate } else { $toolkitPartnerTemplate }

$projectClientTemplate = Join-Path $ProjectDirectory "Analysis\clients\$($Client.ToLower().Replace('-', '-'))\templates\adr-template.md"
$toolkitClientTemplate = Join-Path $toolkitDir "clients\$($Client.ToLower().Replace('-', '-'))\templates\adr-template.md"
$clientTemplatePath = if (Test-Path $projectClientTemplate) { $projectClientTemplate } else { $toolkitClientTemplate }

$projectBaseTemplate = Join-Path $ProjectDirectory "Analysis\ADR-Template.md"
$toolkitBaseTemplate = Join-Path $toolkitDir "ADR-Template.md"
$baseTemplatePath = if (Test-Path $projectBaseTemplate) { $projectBaseTemplate } else { $toolkitBaseTemplate }

# ADR Type templates are now the primary base templates
$baseTemplatePaths = $adrTypeTemplatePaths

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

# Function to merge multiple ADR type templates
function Merge-AdrTypeTemplates {
    param([string[]]$TemplatePaths)

    $mergedContent = @()

    foreach ($templatePath in $TemplatePaths) {
        if (Test-Path $templatePath) {
            $content = Get-Content $templatePath
            if ($mergedContent.Count -eq 0) {
                # First template - add all content
                $mergedContent = $content
            } else {
                # Subsequent templates - merge sections
                $mergedContent = Merge-AdrSections $mergedContent $content
            }
        } else {
            Write-Warning "ADR type template not found: $templatePath"
        }
    }

    return $mergedContent
}

# Function to merge templates
function Merge-Templates {
    param(
        [string]$BaseTemplate,
        [string]$PartnerTemplate,
        [string]$ClientTemplate,
        [object]$PartnerConfig,
        [object]$ClientConfig,
        [hashtable]$Replacements,
        [string[]]$BaseContent = $null
    )

    # Start with base content if provided, otherwise use base template
    if ($BaseContent) {
        $mergedTemplate = $BaseContent
    } else {
        # Start with partner template if it exists, otherwise base template
        $templatePath = if ($PartnerTemplate -and (Test-Path $PartnerTemplate)) {
            $PartnerTemplate
        } else {
            $BaseTemplate
        }
        $mergedTemplate = Get-Content $templatePath
    }

    # Apply partner customizations if partner template exists
    if ($PartnerTemplate -and (Test-Path $PartnerTemplate)) {
        $partnerContent = Get-Content $PartnerTemplate
        $mergedTemplate = Merge-PartnerSections $mergedTemplate $partnerContent $PartnerConfig
    }

    # Apply client customizations if client template exists
    if ($ClientTemplate -and (Test-Path $ClientTemplate)) {
        $clientContent = Get-Content $ClientTemplate
        # Merge client-specific sections into the template
        $mergedTemplate = Merge-ClientSections $mergedTemplate $clientContent $ClientConfig
    }

    # Apply replacements
    foreach ($key in $Replacements.Keys) {
        $mergedTemplate = $mergedTemplate -replace "\{$key\}", $Replacements[$key]
    }

    return $mergedTemplate
}

# Function to merge ADR sections from multiple templates
function Merge-AdrSections {
    param([string[]]$BaseContent, [string[]]$AdditionalContent)

    $result = $BaseContent
    $sectionsToAdd = @()

    # Find all level 2 headers (##) in additional content that aren't already in base
    foreach ($line in $AdditionalContent) {
        if ($line -match "^## (.+)$") {
            $sectionTitle = $matches[1]
            $existingSection = $result | Where-Object { $_ -match "^## $sectionTitle$" }
            if (-not $existingSection) {
                # Find the section content
                $sectionStart = $AdditionalContent.IndexOf($line)
                $sectionEnd = $AdditionalContent.Length
                for ($i = $sectionStart + 1; $i -lt $AdditionalContent.Length; $i++) {
                    if ($AdditionalContent[$i] -match "^## " -or $AdditionalContent[$i] -match "^# ") {
                        $sectionEnd = $i
                        break
                    }
                }
                $sectionContent = $AdditionalContent[$sectionStart..($sectionEnd - 1)]
                $sectionsToAdd += ,$sectionContent
            }
        }
    }

    # Add new sections before the "Consequences" section or at the end
    $insertIndex = -1
    for ($i = 0; $i -lt $result.Length; $i++) {
        if ($result[$i] -match "^## Consequences$") {
            $insertIndex = $i
            break
        }
    }

    if ($insertIndex -eq -1) {
        # No Consequences section found, add at end
        $insertIndex = $result.Length
    }

    foreach ($section in $sectionsToAdd) {
        $result = $result[0..($insertIndex - 1)] + $section + $result[$insertIndex..($result.Length - 1)]
        $insertIndex += $section.Length
    }

    return $result
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

    if ($titleMap.ContainsKey($SectionCode)) {
        return $titleMap[$SectionCode]
    } else {
        return $SectionCode
    }
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
            $pandocArgs += @("--toc", "--toc-depth=3")

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

            # Add resource path for images if they exist
            $imagesPath = Join-Path $OutputPath $ImagesFolder
            if (Test-Path $imagesPath) {
                $pandocArgs += "--resource-path=$imagesPath"
                # For DOCX, also add extract-media to handle images properly
                $pandocArgs += "--extract-media=$imagesPath"
            }
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

            # Add resource path for images if they exist
            $imagesPath = Join-Path $OutputPath $ImagesFolder
            if (Test-Path $imagesPath) {
                $pandocArgs += "--resource-path=$imagesPath"
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

# Function to generate Mermaid diagram files
function New-MermaidFiles {
    param(
        [string]$OutputPath,
        [string[]]$DiagramTemplates,
        [string]$ImagesFolder,
        [string]$AdrTitle,
        [string]$Client,
        [int]$AdrNumber
    )

    $imagesPath = Join-Path $OutputPath $ImagesFolder
    if (!(Test-Path $imagesPath)) {
        New-Item -ItemType Directory -Path $imagesPath -Force | Out-Null
        Write-Host "Created images directory: $imagesPath" -ForegroundColor Blue
    }

    $generatedFiles = @()

    # If no specific templates provided, look for default diagram templates
    if (-not $DiagramTemplates -or $DiagramTemplates.Count -eq 0) {
        # Look for diagram templates in Partner folder under images, then toolkit diagrams
        $partnerImages = Join-Path $OutputPath $ImagesFolder
        $toolkitDiagrams = Join-Path $toolkitDir "diagrams"

        $diagramPaths = @()
        if (Test-Path $partnerImages) {
            $diagramPaths += Get-ChildItem $partnerImages -Filter "*.mmd" -ErrorAction SilentlyContinue
        }
        if (Test-Path $toolkitDiagrams) {
            $diagramPaths += Get-ChildItem $toolkitDiagrams -Filter "*.mmd" -ErrorAction SilentlyContinue
        }

        $DiagramTemplates = $diagramPaths | Select-Object -ExpandProperty FullName
    }

    foreach ($templatePath in $DiagramTemplates) {
        if (Test-Path $templatePath) {
            $templateName = [System.IO.Path]::GetFileNameWithoutExtension($templatePath)
            $outputFileName = "$templateName-$Client-$($AdrNumber.ToString('000')).mmd"
            $outputFilePath = Join-Path $imagesPath $outputFileName

            # Copy template and apply replacements
            $diagramContent = Get-Content $templatePath -Raw

            # Apply basic replacements
            $diagramContent = $diagramContent -replace "\{ADR Title\}", $AdrTitle
            $diagramContent = $diagramContent -replace "\{Client\}", $Client
            $diagramContent = $diagramContent -replace "\{ADR Number\}", $AdrNumber.ToString("000")

            $diagramContent | Out-File $outputFilePath -Encoding UTF8
            $generatedFiles += $outputFilePath

            Write-Host "Generated Mermaid diagram: $outputFilePath" -ForegroundColor Green
        } else {
            Write-Warning "Diagram template not found: $templatePath"
        }
    }

    return $generatedFiles
}

# Function to convert Mermaid files to images
function Convert-MermaidToImages {
    param(
        [string[]]$MermaidFiles,
        [string]$ImagesFolder
    )

    $generatedImages = @()

    # Check if mmdc (Mermaid CLI) is available
    $mmdcCommand = Get-Command mmdc -ErrorAction SilentlyContinue
    if (-not $mmdcCommand) {
        Write-Warning "Mermaid CLI (mmdc) not found. Please install it with: npm install -g @mermaid-js/mermaid-cli"
        Write-Warning "Skipping image generation. You can manually convert .mmd files to images later."
        return $generatedImages
    }

    foreach ($mmdFile in $MermaidFiles) {
        if (Test-Path $mmdFile) {
            $baseName = [System.IO.Path]::GetFileNameWithoutExtension($mmdFile)
            $directory = [System.IO.Path]::GetDirectoryName($mmdFile)

            $svgFile = Join-Path $directory "$baseName.svg"
            $pngFile = Join-Path $directory "$baseName.png"

            # Generate SVG
            try {
                & mmdc -i $mmdFile -o $svgFile -t dark -b transparent
                if (Test-Path $svgFile) {
                    $generatedImages += $svgFile
                    Write-Host "Generated SVG: $svgFile" -ForegroundColor Green
                }
            } catch {
                Write-Warning "Failed to generate SVG for $mmdFile : $_"
            }

            # Generate PNG
            try {
                & mmdc -i $mmdFile -o $pngFile -t dark -b transparent
                if (Test-Path $pngFile) {
                    $generatedImages += $pngFile
                    Write-Host "Generated PNG: $pngFile" -ForegroundColor Green
                }
            } catch {
                Write-Warning "Failed to generate PNG for $mmdFile : $_"
            }
        }
    }

    return $generatedImages
}

# Main script logic
$typeList = $Type -join ", "
Write-Host "Generating $typeList ADR for $Partner + $Client..." -ForegroundColor Cyan

# Set up project structure if not skipped
$partnerPath = Join-Path $ProjectDirectory "Analysis\Partner"

if (-not $SkipStructureSetup) {
    Write-Host "Setting up project structure..." -ForegroundColor Cyan
    $structure = New-AdrStructure -ProjectRoot $ProjectDirectory -PartnerList @($Partner)
    $partnerPath = $structure.PartnerPath
}

# Ensure output directory exists
if (!(Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    Write-Host "Created output directory: $OutputPath" -ForegroundColor Blue
}

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
if ($null -ne $adrNumber) {
    $adrNumber = $adrNumber + 1
} else {
    $adrNumber = 1
}

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
# Start with merged ADR type templates
$mergedAdrTypes = Merge-AdrTypeTemplates $baseTemplatePaths

# Apply partner and client customizations
$mergedTemplate = Merge-Templates `
    -BaseTemplate $null `
    -PartnerTemplate $partnerTemplatePath `
    -ClientTemplate $clientTemplatePath `
    -PartnerConfig $partnerConfig `
    -ClientConfig $clientConfig `
    -Replacements $replacements `
    -BaseContent $mergedAdrTypes

# Create output filename
# Clean the title by removing common prefixes like "ADR:" to avoid duplicate prefixes
$cleanTitle = $Title -replace "^ADR:\s*", ""
$safeTitle = $cleanTitle -replace "[^a-zA-Z0-9]", "-"
$outputBaseName = "ADR-$safeTitle-$Client-$($adrNumber.ToString('000'))"
if ($ProjectName) {
    $outputBaseName += "-$ProjectName"
}

# Set markdown output path now that we have outputBaseName
$markdownOutputPath = Join-Path $partnerPath "$outputBaseName.md"

# Validate content
$validationIssues = Test-ADRCompliance $mergedTemplate $partnerConfig $clientConfig
if ($validationIssues) {
    Write-Warning "ADR validation issues found:"
    $validationIssues | ForEach-Object { Write-Warning "  - $_" }
}

# Display planned output
Write-Host "`nPlanned Output:" -ForegroundColor Cyan
Write-Host "Markdown Source: $markdownOutputPath" -ForegroundColor White
Write-Host "Generated Documents in: $OutputPath" -ForegroundColor White
Write-Host "Files to be created:" -ForegroundColor White
Write-Host "  - $markdownOutputPath" -ForegroundColor White

if ($GenerateDiagrams) {
    Write-Host "  - Diagrams in $($ImagesFolder) folder:" -ForegroundColor White
    if ($DiagramTemplates -and $DiagramTemplates.Count -gt 0) {
        foreach ($template in $DiagramTemplates) {
            $templateName = [System.IO.Path]::GetFileNameWithoutExtension($template)
            Write-Host "    - $templateName-$Client-$($adrNumber.ToString('000')).mmd" -ForegroundColor White
            Write-Host "    - $templateName-$Client-$($adrNumber.ToString('000')).svg" -ForegroundColor White
            Write-Host "    - $templateName-$Client-$($adrNumber.ToString('000')).png" -ForegroundColor White
        }
    } else {
        Write-Host "    - (Auto-discovered diagram templates)" -ForegroundColor White
    }
}

$formats = if ($GenerateAllFormats) {
    $partnerConfig.outputFormats
} else {
    @("docx")  # Default to DOCX
}

foreach ($format in $formats) {
    $outputFilePath = Join-Path $OutputPath "$outputBaseName.$format"
    Write-Host "  - $outputFilePath" -ForegroundColor White
}

# Prompt for confirmation
$confirmation = Read-Host "`nProceed with ADR generation? (Y/n)"
if ($confirmation -ne 'y' -and $confirmation -ne 'Y' -and $confirmation -ne '') {
    Write-Host "ADR generation cancelled." -ForegroundColor Yellow
    exit 0
}

# Save merged template
$mergedTemplate | Out-File $markdownOutputPath -Encoding UTF8
Write-Host "Generated ADR template: $markdownOutputPath" -ForegroundColor Green

# Generate Mermaid diagrams if requested
$mermaidFiles = @()
$generatedImages = @()
if ($GenerateDiagrams) {
    Write-Host "Generating Mermaid diagrams..." -ForegroundColor Cyan

    $mermaidFiles = New-MermaidFiles `
        -OutputPath $OutputPath `
        -DiagramTemplates $DiagramTemplates `
        -ImagesFolder $ImagesFolder `
        -AdrTitle $Title `
        -Client $Client `
        -AdrNumber $adrNumber

    if ($mermaidFiles.Count -gt 0) {
        $generatedImages = Convert-MermaidToImages `
            -MermaidFiles $mermaidFiles `
            -ImagesFolder $ImagesFolder
    }
}

# Generate documents in requested formats
$formats = if ($GenerateAllFormats) {
    $partnerConfig.outputFormats
} else {
    @("docx")  # Default to DOCX
}

foreach ($format in $formats) {
    $outputFilePath = Join-Path $OutputPath "$outputBaseName.$format"

    Generate-Document `
        -InputPath $markdownOutputPath `
        -OutputPath $outputFilePath `
        -Format $format `
        -PartnerConfig $partnerConfig `
        -ClientConfig $clientConfig `
        -Partner $Partner `
        -Client $Client
}

Write-Host "`nADR Generation Complete!" -ForegroundColor Green
Write-Host "Generated files:" -ForegroundColor Cyan
Write-Host "  - Markdown: $(Split-Path $markdownOutputPath -Leaf)" -ForegroundColor White
Get-ChildItem "$OutputPath\$outputBaseName.*" -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}

if ($GenerateDiagrams) {
    Write-Host "Generated diagrams:" -ForegroundColor Cyan
    $imagesPath = Join-Path $OutputPath $ImagesFolder
    if (Test-Path $imagesPath) {
        Get-ChildItem $imagesPath -ErrorAction SilentlyContinue | ForEach-Object {
            Write-Host "  - $($ImagesFolder)/$($_.Name)" -ForegroundColor White
        }
    }
}

if ($validationIssues) {
    Write-Host "`nPlease review and address the validation issues listed above." -ForegroundColor Yellow
}

# Display usage summary
Write-Host "`nNext Steps:" -ForegroundColor Cyan
Write-Host "1. Edit the generated .md file with your specific content" -ForegroundColor White
Write-Host "2. Replace all {placeholder} text with actual values" -ForegroundColor White
if ($GenerateDiagrams) {
    Write-Host "3. Review and customize generated diagram files in the $($ImagesFolder) folder" -ForegroundColor White
    Write-Host "4. Re-run generation to update output documents with diagram changes" -ForegroundColor White
} else {
    Write-Host "3. Re-run generation to update output documents" -ForegroundColor White
}
Write-Host "4. Submit for partner/client approval as required" -ForegroundColor White