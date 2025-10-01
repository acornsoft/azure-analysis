# ADR-Toolkit Deployment Script

<#
.SYNOPSIS
    Deploys the ADR-Toolkit to a target location for use in Azure service analysis projects.

.DESCRIPTION
    This script installs the ADR-Toolkit components to enable ADR generation with
    client/partner-specific branding and templates. It can deploy to local projects
    or shared locations for team use.

.PARAMETER TargetPath
    Path where the ADR-Toolkit should be deployed

.PARAMETER Client
    Client name for client-specific configuration (carter-machinery, ecolab, western-states)

.PARAMETER Partner
    Partner name for partner-specific branding (accenture, acornsoft, avanade, elogic)

.PARAMETER InstallGlobally
    Install ADR-Toolkit globally for all users (requires admin privileges)

.EXAMPLE
    # Deploy ADR-Toolkit to a project with Ecolab client configuration
    .\scripts\Deploy-ADR-Toolkit.ps1 -TargetPath "C:\Projects\MyProject" -Client "ecolab"

.EXAMPLE
    # Deploy with Acornsoft partner branding
    .\scripts\Deploy-ADR-Toolkit.ps1 -TargetPath "C:\Projects\MyProject" -Partner "acornsoft"

.EXAMPLE
    # Global installation for all users
    .\scripts\Deploy-ADR-Toolkit.ps1 -InstallGlobally
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$TargetPath,

    [Parameter(Mandatory = $false)]
    [ValidateSet("carter-machinery", "ecolab", "western-states")]
    [string]$Client,

    [Parameter(Mandatory = $false)]
    [ValidateSet("accenture", "acornsoft", "avanade", "elogic")]
    [string]$Partner,

    [Parameter(Mandatory = $false)]
    [switch]$InstallGlobally
)

# Determine installation path
if ($InstallGlobally) {
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Error "Global installation requires administrator privileges. Please run as administrator."
        exit 1
    }
    $installPath = "$env:ProgramFiles\ADR-Toolkit"
    Write-Host "Installing ADR-Toolkit globally to: $installPath"
} elseif ($TargetPath) {
    $installPath = Join-Path $TargetPath ".adr-toolkit"
    Write-Host "Installing ADR-Toolkit to project: $installPath"
} else {
    Write-Error "Either -TargetPath or -InstallGlobally must be specified"
    exit 1
}

# Create installation directory
if (-not (Test-Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
}

# Copy core ADR-Toolkit files
Write-Host "Copying ADR-Toolkit core files..."
Copy-Item -Path "adr-toolkit\*" -Destination $installPath -Recurse -Force

# Apply client-specific configuration
if ($Client) {
    $clientPath = Join-Path $installPath "clients\$Client"
    if (Test-Path $clientPath) {
        Write-Host "Applying $Client client configuration..."
        # Copy client-specific templates over defaults
        if (Test-Path "$clientPath\templates") {
            Copy-Item -Path "$clientPath\templates\*" -Destination "$installPath\templates" -Recurse -Force
        }
        # Copy client-specific branding
        if (Test-Path "$clientPath\branding") {
            Copy-Item -Path "$clientPath\branding\*" -Destination "$installPath\branding" -Recurse -Force
        }
    } else {
        Write-Warning "Client '$Client' not found in ADR-Toolkit"
    }
}

# Apply partner-specific branding
if ($Partner) {
    $partnerPath = Join-Path $installPath "partners\$Partner"
    if (Test-Path $partnerPath) {
        Write-Host "Applying $Partner partner branding..."
        # Copy partner-specific styles
        if (Test-Path "$partnerPath\styles") {
            Copy-Item -Path "$partnerPath\styles\*" -Destination "$installPath\styles" -Recurse -Force
        }
        # Copy partner-specific templates
        if (Test-Path "$partnerPath\templates") {
            Copy-Item -Path "$partnerPath\templates\*" -Destination "$installPath\templates" -Recurse -Force
        }
    } else {
        Write-Warning "Partner '$Partner' not found in ADR-Toolkit"
    }
}

# Create deployment configuration
$config = @{
    InstallPath = $installPath
    Client = $Client
    Partner = $Partner
    InstallDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Version = "1.0.0"
}

$config | ConvertTo-Json | Out-File -FilePath (Join-Path $installPath "deployment-config.json") -Encoding UTF8

# Create convenience scripts
$generateScript = @"
# ADR Generation Helper Script
# Usage: .\generate-adr.ps1 -Type "technical" -Title "My ADR" -OutputPath ".\Analysis\"

param(
    [string]`$Type = "technical",
    [string]`$Title,
    [string]`$OutputPath = ".\Analysis\"
)

# Import ADR-Toolkit functions
. "$installPath\Generate-Partner-ADR.ps1"

# Generate ADR using toolkit
# [Add ADR generation logic here]
Write-Host "ADR Toolkit ready for use at: $installPath"
"@

$generateScript | Out-File -FilePath (Join-Path $installPath "generate-adr.ps1") -Encoding UTF8

Write-Host ""
Write-Host "ADR-Toolkit deployment completed successfully!"
Write-Host "Installation path: $installPath"
Write-Host ""
Write-Host "Usage:"
Write-Host "1. Navigate to your project directory"
Write-Host "2. Run: & '$installPath\generate-adr.ps1' -Type 'technical' -Title 'My ADR'"
Write-Host ""
Write-Host "For more information, see: $installPath\ADR-DOCX-Template-Guide.md"