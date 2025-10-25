## Quick Start - Integrated Workflow

For new analysis projects, simply cd to your project directory and run:

```powershell
# For a deep-dive analysis on Ecolab.Crm.Azure.SOW
& "path\to\toolkit\Generate-Partner-ADR.ps1" `
  -Partner "Accenture" `
  -Client "Ecolab" `
  -Type "func" `
  -Flavor "deep-dive" `
  -Title "Deep Dive Analysis of Ecolab.Crm.Azure.SOW"
```

This automatically:
1. ✅ Creates the `Analysis/Partner/` structure
2. ✅ Generates initial Markdown template in `Analysis/Partner/`
3. ✅ Creates partner-specific documents in `Analysis/Partner/[Partner]/`

### File Organization
- **Markdown Sources**: `Analysis/Partner/*.md` (shared across partners)
- **Generated Documents**: `Analysis/Partner/[PartnerName]/*.docx` (partner-branded)
- **Images/Diagrams**: `Analysis/images/` (shared assets)

A comprehensive toolkit for generating Architecture Decision Records (ADRs) with client and partner-specific branding, templates, and automation.

## Enhanced Requirements Analysis

The ADR-Toolkit includes an enhanced requirements template (`types/requirements/`) with comprehensive User Story capabilities:

- **Detailed User Story Format**: Business context, scenarios, scenario-based acceptance criteria, and story point breakdowns
- **Requirements Decomposition**: Break down complex requirements into implementable user stories
- **Standalone Templates**: `User-Story-Template-Enhanced.md` for independent use
- **Integration Guide**: Complete documentation in `types/requirements/README.md`

Use the requirements type when generating ADRs that require detailed business analysis and user story breakdown:

```powershell
# Generate requirements ADR with User Story format
.\Generate-Partner-ADR.ps1 -Type "requirements" -Title "Business Requirements Analysis"
```

## Overview

The ADR-Toolkit provides:
- **Client-specific configurations** for Carter Machinery, Ecolab, and Western States
- **Partner branding** for Accenture, Acornsoft, Avanade, and eLogic
- **DOCX template generation** with professional formatting
- **PowerShell automation** for ADR creation and management
- **Customizable templates** for different ADR styles
- **Enhanced Requirements Analysis** with comprehensive User Story templates

## Quick Start

### 1. Deploy the Toolkit

#### Option A: Deploy to a Project
```powershell
# Deploy ADR-Toolkit to your project with Ecolab branding
.\scripts\Deploy-ADR-Toolkit.ps1 -TargetPath "C:\MyProject" -Client "ecolab"
```

#### Option B: Global Installation
```powershell
# Install ADR-Toolkit globally (requires admin)
.\scripts\Deploy-ADR-Toolkit.ps1 -InstallGlobally
```

### 2. Generate an ADR

#### Using PowerShell Script
```powershell
# Generate a technical ADR
.\generate-adr.ps1 -Type "technical" -Title "Database Architecture Decision" -OutputPath ".\Analysis\"
```

#### Using the Main Script
```powershell
# Run the partner ADR generator
.\Generate-Partner-ADR.ps1
```

## Directory Structure

```
adr-toolkit/
├── ADR-DOCX-Template-Guide.md      # Comprehensive guide for DOCX templates
├── Create-DOCX-Templates.md        # How to create custom DOCX templates
├── Generate-Partner-ADR.ps1        # Main ADR generation script
├── clients/                        # Client-specific configurations
│   ├── carter-machinery/
│   ├── ecolab/
│   └── western-states/
├── partners/                       # Partner-specific branding
│   ├── accenture/
│   ├── acornsoft/
│   ├── avanade/
│   └── elogic/
└── types/                          # ADR type templates
    ├── requirements/               # Enhanced requirements with User Stories
    ├── func/                       # Azure Functions templates
    ├── apim/                       # API Management templates
    └── ...                         # Additional service templates
```

## Client Configurations

### Ecolab
- **Templates**: Custom ADR templates with Ecolab branding
- **DOCX Template**: Professional document formatting
- **Configuration**: `clients/ecolab/config.json`

### Carter Machinery
- **Templates**: Industry-specific ADR formats
- **Branding**: Carter Machinery visual identity
- **Configuration**: `clients/carter-machinery/config.json`

### Western States
- **Templates**: Regional business requirements
- **Branding**: Western States corporate styling
- **Configuration**: `clients/western-states/config.json`

## Partner Branding

### Accenture
- **Styles**: `partners/accenture/styles/accenture.css`
- **Templates**: Accenture-standard ADR formats
- **Configuration**: Professional consulting presentation

### Acornsoft
- **Styles**: Modern, clean design aesthetic
- **Templates**: Technology-focused ADR structures
- **Configuration**: Innovation and quality emphasis

### Avanade
- **Styles**: Enterprise-grade professional styling
- **Templates**: Comprehensive business technology ADRs
- **Configuration**: Large-scale implementation focus

### eLogic
- **Styles**: Technical precision and clarity
- **Templates**: `partners/elogic/templates/elogic-template.docx`
- **Configuration**: Engineering excellence standards

## ADR Generation Process

### 1. Template Selection
The toolkit automatically selects the appropriate template based on:
- Client configuration (if specified)
- Partner branding (if specified)
- ADR type (technical, business, architectural, implementation, **requirements**)

### Requirements Type Features
When using `-Type "requirements"`, the toolkit provides:
- **User Story Templates**: Comprehensive format with business context and scenario-based acceptance criteria
- **Story Point Estimation**: Built-in effort estimation framework
- **Requirements Breakdown**: Tools for decomposing complex business requirements
- **Integration Guidance**: Complete documentation for requirements analysis

### 2. Content Population
Templates include placeholders for:
- ADR title and number
- Context and problem statement
- Decision and rationale
- Consequences and mitigation
- Implementation details

### 3. Output Formats
- **Markdown**: For version control and collaboration
- **DOCX**: For formal documentation and presentations
- **HTML**: For web publishing with custom CSS

## Configuration Files

Each client and partner has a `config.json` file with settings for:

```json
{
  "name": "Client/Partner Name",
  "branding": {
    "logo": "path/to/logo.png",
    "colors": {
      "primary": "#0066CC",
      "secondary": "#0099FF"
    },
    "fonts": {
      "heading": "Arial",
      "body": "Calibri"
    }
  },
  "templates": {
    "adr": "path/to/adr-template.md",
    "docx": "path/to/template.docx"
  },
  "standards": {
    "adrNumbering": "ADR-{YYYY}-{NNN}",
    "approvalProcess": "peer-review",
    "retention": "permanent"
  }
}
```

## PowerShell Scripts

### Generate-Partner-ADR.ps1
Main script for ADR generation with the following features:
- Interactive mode for guided ADR creation
- Template selection based on client/partner
- Content validation and formatting
- Output in multiple formats

### Deploy-ADR-Toolkit.ps1
Deployment script for installing the toolkit:
- Project-specific or global installation
- Client/partner configuration application
- Convenience script creation
- Configuration file generation

## DOCX Template Creation

### Template Requirements
- Use Microsoft Word 2016+ for template creation
- Include content controls for dynamic content
- Maintain consistent styling and branding
- Test with various content lengths

### Content Controls
- `ADR_Number`: Auto-generated ADR number
- `ADR_Title`: ADR title input
- `ADR_Context`: Problem context
- `ADR_Decision`: Decision made
- `ADR_Rationale`: Decision reasoning
- `ADR_Consequences`: Positive/negative consequences

## Integration with Azure Analysis Framework

The ADR-Toolkit integrates seamlessly with the Azure Service Analysis Framework:

1. **Analysis Results** → ADR-Toolkit input
2. **AI-Generated Content** → Professional formatting
3. **Client Branding** → Stakeholder-ready documents
4. **Version Control** → Git-compatible markdown

## Best Practices

### ADR Creation
- Use descriptive, actionable titles
- Include sufficient context for future readers
- Document assumptions and constraints
- Link related ADRs and decisions

### Requirements Analysis Best Practices
- Use the `requirements` type for business requirements and user story development
- Break down complex requirements into detailed user stories with scenario-based acceptance criteria
- Include story point estimates for effort planning
- Reference the User Story templates in `types/requirements/` for consistent formatting

### Template Customization
- Start with provided templates as baselines
- Customize branding while maintaining readability
- Test templates with real content before deployment
- Version control template changes

### Deployment Strategy
- Use project-specific deployment for isolated teams
- Use global deployment for enterprise-wide consistency
- Regularly update templates based on feedback
- Maintain backward compatibility

## Troubleshooting

### Common Issues

**Template Not Found**
- Check client/partner configuration
- Verify deployment completed successfully
- Ensure correct file paths in config.json

**DOCX Generation Fails**
- Verify Microsoft Word installation
- Check template file integrity
- Review content control names

**Branding Not Applied**
- Confirm client/partner parameter usage
- Check configuration file syntax
- Verify branding files exist

### Support
- Check `ADR-DOCX-Template-Guide.md` for detailed instructions
- Review `Create-DOCX-Templates.md` for template creation
- Test with provided example configurations

## Contributing

### Adding New Clients
1. Create `clients/[client-name]/` directory
2. Add `config.json` with client settings
3. Create `branding/` and `templates/` subdirectories
4. Customize templates and styles as needed

### Adding New Partners
1. Create `partners/[partner-name]/` directory
2. Add `config.json` with partner settings
3. Create `styles/` and `templates/` subdirectories
4. Develop partner-specific branding and formats

### Template Development
- Follow established naming conventions
- Include comprehensive content controls
- Test with various content scenarios
- Document customization options

## License

This ADR-Toolkit is part of the Azure Service Analysis Framework and follows the same licensing terms.

## Version History

- **v1.1.0**: Enhanced requirements template with comprehensive User Story format
  - Added `types/requirements/` with detailed user story templates
  - Integrated story point estimation and scenario-based acceptance criteria frameworks
  - Added standalone User Story templates for independent use
- **v1.0.0**: Initial release with client and partner configurations
- Support for Ecolab, Carter Machinery, Western States clients
- Support for Accenture, Acornsoft, Avanade, eLogic partners
- DOCX and Markdown template generation
- PowerShell automation scripts