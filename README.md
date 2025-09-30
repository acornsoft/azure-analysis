# Azure Service Analysis Framework

A comprehensive framework for analyzing, documenting, and generating Architecture Decis### 📊 Quality Standards & Metrics

#### Analysis Quality Requirements
- **Minimum Depth**: 10,000+ characters of documented reasoning and analysis
- **Pattern Identification**: Identify 5+ reusable architectural patterns per analysis
- **Evidence-Based**: All recommendations supported by data, Azure documentation, and analysis
- **Actionable Outcomes**: Include specific, implementable next steps and success metrics

#### Quality Assurance Framework
- **Component Completeness**: 100% inventory of service components and dependencies
- **Technical Accuracy**: Verification against official Azure documentation and best practices
- **Business Alignment**: Recommendations tied to business objectives and stakeholder needs
- **Documentation Standards**: Consistent ADR format with proper versioning and change tracking

## 🛠️ ADR-Toolkit Integration

### Professional ADR Generation
The integrated ADR-Toolkit provides enterprise-grade ADR creation with:

- **Client-Specific Branding**: Custom templates for Carter Machinery, Ecolab, and Western States
- **Partner Branding**: Professional styling for Accenture, Acornsoft, Avanade, and eLogic
- **DOCX Template Generation**: Automated creation of formatted Word documents
- **PowerShell Automation**: Streamlined ADR creation and management workflows

### Toolkit Features
- **Multi-Format Output**: Markdown for version control, DOCX for stakeholders
- **Template Customization**: Client and partner-specific configurations
- **Quality Assurance**: Built-in validation and formatting standards
- **Deployment Automation**: Easy installation for projects and teams

### Quick ADR-Toolkit Usage
```powershell
# Deploy ADR-Toolkit to your project
.\scripts\Deploy-ADR-Toolkit.ps1 -TargetPath "C:\MyProject" -Client "ecolab"

# Generate a professional ADR
.\adr-toolkit\Generate-Partner-ADR.ps1
```

See **[ADR-Toolkit README](adr-toolkit/README.md)** for complete documentation.ADRs) for any Azure service supported by the Azure portal. This framework provides standardized approaches for service teardown, architectural analysis, and decision documentation.

## Overview

This repository contains:
- **Standards & Best Practices**: Consistent methodologies for Azure service analysis
- **Templates**: Reusable ADR and technical spike templates
- **Prompts & Instructions**: AI assistant prompts for thorough exploration
- **Examples**: Real-world examples across different Azure services
- **Documentation**: Guides and reference materials

## Current Examples

### Azure Data Factory (ADF) Examples
- **[ADR-D365-Snowflake-D-Pipeline-Analysis-001.md](examples/adf/ADR-D365-Snowflake-D-Pipeline-Analysis-001.md)**: Comprehensive analysis of production pipeline with One Customer enhancements
- **[ADR-D365-PZMigration-D-Pipeline-Analysis-001.md](examples/adf/ADR-D365-PZMigration-D-Pipeline-Analysis-001.md)**: Reference implementation documenting proven architectural patterns

### Key Analysis Features Demonstrated
- **Component Inventory**: Automated discovery of pipelines, data flows, datasets, and linked services
- **Pattern Recognition**: Identification of staging layers, incremental loading, and error handling patterns
- **Gap Analysis**: Comparison against best practices and identification of improvement opportunities
- **Implementation Roadmap**: Phased approach to architectural improvements
- **Success Metrics**: Measurable outcomes and business value assessment

## Repository Structure

```
azure-analysis/
├── .github/
│   ├── prompts/           # AI assistant prompts and instructions
│   └── workflows/         # GitHub Actions for automation
├── standards/             # Best practices and methodologies
├── templates/
│   ├── adrs/             # ADR templates for different styles
│   └── spikes/           # Technical spike templates
├── examples/
│   ├── adf/              # ADF pipeline analysis examples
│   ├── aks/              # AKS cluster analysis examples
│   └── synapse/          # Synapse workspace examples
├── docs/                 # Documentation and guides
├── scripts/              # Automation and utility scripts
├── adr-toolkit/          # 🆕 ADR-Toolkit with client/partner branding
│   ├── ADR-DOCX-Template-Guide.md    # DOCX template creation guide
│   ├── Create-DOCX-Templates.md      # Template development instructions
│   ├── Generate-Partner-ADR.ps1      # Main ADR generation script
│   ├── README.md                     # ADR-Toolkit documentation
│   ├── clients/                      # Client-specific configurations
│   │   ├── carter-machinery/
│   │   ├── ecolab/
│   │   └── western-states/
│   └── partners/                     # Partner-specific branding
│       ├── accenture/
│       ├── acornsoft/
│       ├── avanade/
│       └── elogic/
└── README.md

## Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/acornsoft/azure-analysis.git
cd azure-analysis
```

### 2. Choose Your Analysis Approach

#### For ADF Pipeline Analysis
```bash
# Copy ADF standards to your workspace
cp -r standards/adf-analysis/* /path/to/your/adf/workspace/.github/
```

#### For General Azure Service Analysis
```bash
# Use the universal analysis framework
cp standards/universal-analysis/* /path/to/your/workspace/.github/
```

### 3. Generate Your First ADR
```bash
# Use the interactive ADR generator
./scripts/generate-adr.sh --service adf --style technical
```

## ADR Generation Styles

| Style | Audience | Focus | Use Case |
|-------|----------|-------|----------|
| **Technical** | Developers, Architects | Implementation Details | Code reviews, optimization |
| **Business** | Executives, Stakeholders | Business Value | Decision making, funding |
| **Architectural** | Enterprise Architects | System Design | Integration planning |
| **Implementation** | Project Managers | Execution Plan | Project planning, timelines |

## 🤖 AI Assistant Integration

### Sherpa Agent Mode
The framework includes specialized AI assistant instructions that enable "Sherpa Agent" mode - a thorough, self-questioning exploration methodology that:

- **Adapts to Workspace Context**: Automatically scans project structure and existing documentation
- **Asks Critical Questions**: Self-generates questions to ensure comprehensive analysis
- **Recognizes Patterns**: Identifies architectural patterns, anti-patterns, and best practices
- **Generates Multiple ADR Styles**: Creates appropriate documentation for different audiences
- **Maintains Quality Standards**: Enforces minimum analysis depth and evidence requirements

### Supported AI Assistants
- **GitHub Copilot**: Primary supported assistant with custom instructions
- **Continue.dev**: Compatible with framework prompts
- **CodeGPT**: Works with custom prompt templates
- **Other AI Assistants**: Framework designed to work with any AI coding assistant

### Key Integration Features
- **Workspace-Agnostic**: Instructions work across different project structures
- **Service-Adaptive**: Automatically adjusts analysis approach based on target Azure service
- **Multi-Style Generation**: Flexible ADR creation (Technical, Business, Architectural, Implementation)
- **Pattern Recognition**: Automated identification of architectural patterns and gaps

### 📋 Standardized Processes
- **ADR Templates**: Consistent structure across all services
- **Technical Spikes**: Focused research for architectural uncertainties
- **Quality Assurance**: Built-in checklists and validation
- **Azure DevOps Integration**: Work item tracking and project management

### � Quality Standards & Metrics

#### Analysis Quality Requirements
- **Minimum Depth**: 10,000+ characters of documented reasoning and analysis
- **Pattern Identification**: Identify 5+ reusable architectural patterns per analysis
- **Evidence-Based**: All recommendations supported by data, Azure documentation, and analysis
- **Actionable Outcomes**: Include specific, implementable next steps and success metrics

#### Quality Assurance Framework
- **Component Completeness**: 100% inventory of service components and dependencies
- **Technical Accuracy**: Verification against official Azure documentation and best practices
- **Business Alignment**: Recommendations tied to business objectives and stakeholder needs
- **Documentation Standards**: Consistent ADR format with proper versioning and change tracking

## Usage Examples

### ADF Pipeline Analysis
```bash
# Analyze a pipeline and generate technical ADR
analyze-service --service adf --pipeline "CustomerSync" --style technical

# Compare two pipeline implementations
compare-implementations --service adf --source "LegacyPipeline" --target "OptimizedPipeline"
```

### AKS Cluster Analysis
```bash
# Analyze cluster architecture
analyze-service --service aks --cluster "production-cluster" --style architectural

# Generate security-focused ADR
generate-adr --service aks --focus security --style implementation
```

### Synapse Workspace Analysis
```bash
# Analyze data warehouse design
analyze-service --service synapse --workspace "analytics-workspace" --style business

# Create performance optimization ADR
generate-adr --service synapse --focus performance --style technical
```

## Contributing

### Adding a New Azure Service
1. Create service-specific folder in `examples/`
2. Add service-specific prompts in `.github/prompts/`
3. Create service-specific templates in `templates/`
4. Update documentation in `docs/`

### Improving Standards
1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request with detailed ADR

## Documentation

- **[Getting Started Guide](docs/getting-started.md)**: Complete setup and first analysis
- **[ADR Best Practices](docs/adr-best-practices.md)**: Writing effective ADRs
- **[Service-Specific Guides](docs/services/)**: Detailed guides for each Azure service
- **[API Reference](docs/api-reference.md)**: Script and tool documentation

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/acornsoft/azure-analysis/issues)
- **Discussions**: [GitHub Discussions](https://github.com/acornsoft/azure-analysis/discussions)
- **Documentation**: [Wiki](https://github.com/acornsoft/azure-analysis/wiki)

---

## Repository Status

- **Version**: 1.0.0
- **Last Updated**: September 30, 2025
- **Supported Services**: ADF, AKS, Synapse Analytics
- **ADR Styles**: Technical, Business, Architectural, Implementation
- **AI Integration**: Copilot, Continue.dev, CodeGPT compatible
