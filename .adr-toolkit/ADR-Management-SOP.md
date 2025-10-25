# ADR Management Standard Operating Procedure (SOP)

## Overview
This SOP establishes the standardized process for ADR (Architecture Decision Record) creation, management, and distribution across all .NET projects (.csproj-based services).

## Folder Structure Standard

### Required Structure
```
ProjectRoot/
├── Analysis/
│   ├── Partner/                    # Shared Markdown sources and partner outputs
│   │   ├── [PartnerName]/         # Partner-specific generated documents
│   │   │   ├── ADR-*.docx        # Partner-branded Word documents
│   │   │   ├── ADR-*.html        # HTML versions
│   │   │   └── ADR-*.pdf         # PDF versions (optional)
│   │   ├── ADR-*.md              # Shared Markdown source files
│   │   ├── scripts/              # Generation and utility scripts
│   │   │   └── Generate-All-Partner-ADRs.ps1
│   │   └── README.md             # Structure documentation
│   └── images/                   # Shared images and diagrams
└── [Project Files...]
```

### Key Principles
1. **Markdown at Partner Level**: All ADR source files (.md) reside in `Analysis/Partner/`
2. **Partner-Specific Outputs**: Generated documents (.docx, .html, .pdf) in `Analysis/Partner/[PartnerName]/`
3. **Shared Assets**: Images and diagrams in `Analysis/images/`
4. **Automated Generation**: Use provided scripts for consistent output across partners

## Setup Instructions

### For New Projects
1. Navigate to the project root directory (containing .csproj files)
2. Run the setup script:
   ```powershell
   # From toolkit directory
   .\Setup-Adr-Structure.ps1 -ProjectDirectory "C:\Path\To\Your\Project"

   # Or from project directory
   & "C:\Path\To\Toolkit\Setup-Adr-Structure.ps1"
   ```
3. The script will:
   - Discover .csproj files
   - Create the standardized folder structure
   - Generate utility scripts
   - Create documentation

### Supported Partners
- Accenture
- Acornsoft
- Avanade
- eLogic

### Customization
Modify the setup script parameters for different partners:
```powershell
.\Setup-Adr-Structure.ps1 -Partners @("Accenture", "Acornsoft") -ProjectDirectory "C:\Path\To\Project"
```

## ADR Creation Workflow

### 1. Create Markdown Source
- Place ADR Markdown files in `Analysis/Partner/`
- Use standard ADR template format
- Include all required sections and placeholders

### 2. Generate Partner Documents
```powershell
# Generate for all partners
.\Analysis\Partner\scripts\Generate-All-Partner-ADRs.ps1 -MarkdownFile "Analysis\Partner\ADR-Example.md"

# Generate for specific partners
.\Analysis\Partner\scripts\Generate-All-Partner-ADRs.ps1 -MarkdownFile "Analysis\Partner\ADR-Example.md" -Partners @("Accenture", "Acornsoft")

# Include all formats (DOCX, HTML, PDF)
.\Analysis\Partner\scripts\Generate-All-Partner-ADRs.ps1 -MarkdownFile "Analysis\Partner\ADR-Example.md" -GenerateAllFormats
```

### 3. Review and Distribute
- Review generated documents in respective partner folders
- Distribute to appropriate stakeholders
- Maintain source Markdown for future updates

## File Naming Conventions

### Markdown Sources
- `ADR-[Descriptive-Title].md`
- Example: `ADR-Update-User-Account-Change-Feed-Processing-Based-on-Sales-Skill.md`

### Generated Documents
- `ADR-[Descriptive-Title]-[Partner].docx`
- Example: `ADR-Update-User-Account-Change-Feed-Processing-Based-on-Sales-Skill-Accenture.docx`

## Integration with Existing Toolkit

### Toolkit Location
The ADR toolkit is located at:
```
C:\Users\[Username]\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit
```

### Template Discovery
- Partner templates: `partners/[partner]/templates/[partner]-template.docx`
- Automatic template application during generation
- Fallback to default formatting if templates unavailable

## Maintenance and Updates

### Updating ADRs
1. Edit the Markdown source in `Analysis/Partner/`
2. Re-run generation script
3. All partner documents update automatically

### Adding New Partners
1. Add partner name to setup script parameters
2. Ensure partner templates exist in toolkit
3. Re-run setup if needed

### Version Control
- Commit Markdown sources and generated documents
- Use meaningful commit messages
- Tag important ADR versions

## Quality Assurance

### Validation Checklist
- [ ] Markdown source follows ADR template
- [ ] All placeholders replaced with actual content
- [ ] Documents generate without errors
- [ ] Partner-specific branding applied correctly
- [ ] Images and diagrams render properly
- [ ] File naming conventions followed

### Testing
- Generate documents for all supported partners
- Verify formatting in different viewers
- Test PDF generation (requires LaTeX)
- Validate links and cross-references

## Troubleshooting

### Common Issues
1. **Missing Templates**: Ensure toolkit is accessible and templates exist
2. **Pandoc Errors**: Install pandoc and required dependencies
3. **Permission Issues**: Run PowerShell as administrator if needed
4. **Path Issues**: Use absolute paths when calling scripts

### Support
- Check toolkit README for detailed documentation
- Review generated README.md in project structure
- Contact ADR toolkit maintainers for complex issues

## Compliance and Standards

### Required Sections
- Title and Status
- Context and Problem Statement
- Decision Drivers
- Considered Options
- Decision Outcome
- Consequences
- Confirmation

### Partner-Specific Requirements
- Accenture: Executive Summary, Business Case
- Acornsoft: Technical Architecture, Risk Assessment
- Avanade: Stakeholder Impact, Implementation Roadmap
- eLogic: Regulatory Compliance, Safety Standards

This SOP ensures consistent ADR management across all .NET projects, enabling efficient collaboration with multiple partners while maintaining high quality and professional presentation.</content>
<parameter name="filePath">C:\Users\david.blaszyk\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit\ADR-Management-SOP.md