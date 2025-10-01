# Initialize Analysis Workspace

<#
.SYNOPSIS
    Initializes a new Azure service analysis workspace with the Azure Service Analysis Framework.

.DESCRIPTION
    This script sets up a new analysis workspace by copying the necessary standards,
    templates, and instructions from the framework repository to enable AI-assisted
    analysis of Azure services.

.PARAMETER FrameworkPath
    Path to the Azure Service Analysis Framework repository (source)

.PARAMETER WorkspacePath
    Path to the analysis workspace to initialize (destination)

.PARAMETER Service
    Azure service to analyze (adf, aks, synapse, etc.)

.PARAMETER Force
    Overwrite existing files without prompting

.EXAMPLE
    # Initialize ADF analysis workspace
    .\scripts\Initialize-AnalysisWorkspace.ps1 -FrameworkPath "C:\framework" -WorkspacePath "C:\analysis" -Service "adf"

.EXAMPLE
    # Initialize with force overwrite
    .\scripts\Initialize-AnalysisWorkspace.ps1 -FrameworkPath "C:\framework" -WorkspacePath "C:\analysis" -Service "aks" -Force
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$FrameworkPath,

    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath,

    [Parameter(Mandatory = $false)]
    [string]$Service = "adf",

    [Parameter(Mandatory = $false)]
    [switch]$Force
)

# Validate paths
if (-not (Test-Path $FrameworkPath)) {
    Write-Error "Framework path does not exist: $FrameworkPath"
    exit 1
}

if (-not (Test-Path $WorkspacePath)) {
    Write-Host "Creating workspace directory: $WorkspacePath"
    New-Item -ItemType Directory -Path $WorkspacePath -Force | Out-Null
}

# Function to copy with confirmation
function Copy-WithConfirmation {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Description
    )

    if ((Test-Path $Destination) -and -not $Force) {
        $response = Read-Host "Overwrite existing $Description? (y/N)"
        if ($response -ne "y" -and $response -ne "Y") {
            Write-Host "Skipping $Description"
            return
        }
    }

    Write-Host "Copying $Description..."
    Copy-Item -Path $Source -Destination $Destination -Recurse -Force
}

# Copy core framework files
Write-Host "Initializing Azure Service Analysis Framework workspace..."
Write-Host "Framework: $FrameworkPath"
Write-Host "Workspace: $WorkspacePath"
Write-Host "Service: $Service"
Write-Host ""

# Create .github directory if it doesn't exist
$githubPath = Join-Path $WorkspacePath ".github"
if (-not (Test-Path $githubPath)) {
    New-Item -ItemType Directory -Path $githubPath -Force | Out-Null
}

# Copy AI assistant instructions
$instructionsSource = Join-Path $FrameworkPath ".github\copilot-instructions.md"
$instructionsDest = Join-Path $githubPath "copilot-instructions.md"
Copy-WithConfirmation -Source $instructionsSource -Destination $instructionsDest -Description "AI assistant instructions"

# Copy standards
$standardsSource = Join-Path $FrameworkPath "standards\*"
$standardsDest = Join-Path $githubPath "standards"
Copy-WithConfirmation -Source $standardsSource -Destination $standardsDest -Description "analysis standards"

# Copy service-specific standards if available
$serviceStandardsSource = Join-Path $FrameworkPath "standards\$Service-*"
if (Test-Path $serviceStandardsSource) {
    Copy-WithConfirmation -Source $serviceStandardsSource -Destination $standardsDest -Description "service-specific standards"
}

# Copy templates
$templatesSource = Join-Path $FrameworkPath "templates\*"
$templatesDest = Join-Path $WorkspacePath "templates"
Copy-WithConfirmation -Source $templatesSource -Destination $templatesDest -Description "ADR templates"

# Copy examples for reference
$examplesSource = Join-Path $FrameworkPath "examples\$Service"
$examplesDest = Join-Path $WorkspacePath "examples"
if (Test-Path $examplesSource) {
    Copy-WithConfirmation -Source $examplesSource -Destination $examplesDest -Description "service examples"
}

# Create Analysis directory
$analysisPath = Join-Path $WorkspacePath "Analysis"
if (-not (Test-Path $analysisPath)) {
    New-Item -ItemType Directory -Path $analysisPath -Force | Out-Null
    Write-Host "Created Analysis directory"
}

# Create README for workspace
$readmePath = Join-Path $WorkspacePath "README.md"
$readmeContent = @"
# Azure Service Analysis Workspace

This workspace is configured for analyzing Azure $Service services using the Azure Service Analysis Framework.

## Setup
- AI assistant instructions: .github/copilot-instructions.md
- Analysis standards: .github/standards/
- ADR templates: templates/
- Reference examples: examples/

## Getting Started
1. Open this workspace in VS Code with AI assistant enabled
2. Use prompts like: "Analyze the current state of [service/component] and identify architectural patterns"
3. Generate ADRs with: "Generate a [technical/business/architectural/implementation] ADR for [component]"

## Analysis Directory
Place all generated ADRs and analysis documents in the Analysis/ directory.

## Resources
- Framework Repository: $FrameworkPath
- Documentation: $FrameworkPath/docs/
"@

if (-not (Test-Path $readmePath) -or $Force) {
    $readmeContent | Out-File -FilePath $readmePath -Encoding UTF8
    Write-Host "Created workspace README.md"
}

Write-Host ""
Write-Host "Workspace initialization complete!"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Open $WorkspacePath in VS Code"
Write-Host "2. Ensure AI assistant can access .github/copilot-instructions.md"
Write-Host "3. Start analysis with: 'Analyze the current state of your $Service service'"
Write-Host ""
Write-Host "For help, see: $FrameworkPath/docs/getting-started.md"