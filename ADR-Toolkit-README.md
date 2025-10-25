# ADR Toolkit Template

A portable, reusable toolkit for generating professional Accenture-branded Architecture Decision Records (ADRs) in any VS Code workspace.

## Features

- **Professional Branding**: Accenture-styled DOCX documents with proper formatting
- **Multiple Formats**: Generate ADRs in Markdown, DOCX, and HTML
- **VS Code Integration**: Built-in tasks and commands for seamless workflow
- **Command Line Support**: Batch file for quick operations
- **Configurable**: Partner and client-specific branding
- **Portable**: Single template archive deployable to any workspace

## Quick Start

### Option 1: Automated Setup (Recommended)

1. Copy `adr-toolkit-template.zip` and `Setup-Adr-Toolkit.ps1` to your target workspace
2. Run the setup script:

```powershell
# Basic setup with defaults
.\Setup-Adr-Toolkit.ps1

# Custom partner/client
.\Setup-Adr-Toolkit.ps1 -Partner "Accenture" -Client "YourClient"

# Force overwrite existing toolkit
.\Setup-Adr-Toolkit.ps1 -Force
```

### Option 2: Manual Setup

1. Extract `adr-toolkit-template.zip` to `.adr-toolkit/` in your workspace
2. Copy `.vscode/tasks.json` from the template
3. Update `.adr-toolkit/config.json` with your project details

## Usage

### In VS Code

1. **Convert Markdown to DOCX**:
   - Open a markdown file
   - Ctrl+Shift+P → "Tasks: Run Task" → "Convert to Accenture DOCX"
   - Or use Co-Pilot: "Convert this markdown file to DOCX"

2. **Generate New ADR**:
   - Ctrl+Shift+P → "Tasks: Run Task" → "Generate ADR"
   - Enter your ADR title when prompted

### Command Line

```batch
# Convert markdown file to DOCX
adr convert "path\to\your\file.md"

# Generate new ADR
adr generate "Your ADR Title"

# Show help
adr help
```

## Requirements

- **PowerShell**: Core or Desktop edition
- **Pandoc**: For document conversion (install via Chocolatey: `choco install pandoc`)
- **VS Code**: For integrated tasks (optional for command-line usage)

## Configuration

Edit `.adr-toolkit/config.json` to customize:

```json
{
  "partner": {
    "name": "Accenture",
    "code": "accenture",
    "logo": "path/to/logo.png"
  },
  "client": {
    "name": "Your Client",
    "code": "your-client"
  },
  "project": {
    "name": "Your Project",
    "code": "your-project"
  }
}
```

## File Structure

```
.adr-toolkit/
├── config.json              # Workspace configuration
├── Convert-ToAccentureDocx.ps1    # DOCX conversion script
├── Generate-Partner-ADR.ps1       # ADR generation script
├── templates/               # Document templates
│   ├── reference.docx       # DOCX reference template
│   └── adr-template.md      # ADR markdown template
└── docs/                   # Documentation

.vscode/
└── tasks.json              # VS Code tasks

adr.bat                     # Command-line helper
```

## Troubleshooting

### Pandoc Not Found
Install Pandoc:
```powershell
choco install pandoc
# Or download from: https://pandoc.org/installing.html
```

### Permission Errors
Run PowerShell as Administrator or:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### VS Code Tasks Not Appearing
Reload VS Code window: Ctrl+Shift+P → "Developer: Reload Window"

## Advanced Usage

### Global Installation

For system-wide availability, create a PowerShell module:

1. Create `C:\Users\[username]\Documents\WindowsPowerShell\Modules\AdrToolkit\`
2. Copy toolkit scripts there
3. Add to your PowerShell profile:

```powershell
# Add to $PROFILE
Import-Module AdrToolkit
```

### VS Code Extension

Create a custom VS Code extension for integrated ADR generation (advanced).

### Git Template

Add to global git templates for automatic inclusion in new repositories:

```bash
git config --global init.templateDir ~/.git-templates
# Copy .adr-toolkit to ~/.git-templates/
```

## Contributing

1. Test in a clean workspace
2. Update templates as needed
3. Regenerate `adr-toolkit-template.zip`
4. Update this README

## License

Internal Accenture use only. Not for distribution outside Accenture.