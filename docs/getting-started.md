# Getting Started with Azure Service Analysis Framework

This guide will help you get started with analyzing any Azure service using our standardized framework.

## Prerequisites

- Git for version control
- VS Code with AI assistant extensions (Continue.dev, CodeGPT, or similar)
- Access to Azure portal and target services
- Basic understanding of Azure services and architecture

## Quick Setup

### 1. Clone the Repository
```bash
git clone https://github.com/acornsoft/azure-service-analysis-framework.git
cd azure-service-analysis-framework
```

### 2. Initialize Git Repository
```bash
git init
git add .
git commit -m "Initial commit: Azure Service Analysis Framework"
```

### 3. Set Up Remote Repository
```bash
# Create repository on GitHub under acornsoft account
# Then add remote
git remote add origin https://github.com/acornsoft/azure-service-analysis-framework.git
git push -u origin main
```

## Framework Components

### Core Files
- **`.github/copilot-instructions.md`**: AI assistant configuration for workspace-agnostic analysis
- **`standards/`**: Best practices and methodologies for different services
- **`templates/`**: Reusable ADR and spike templates
- **`examples/`**: Real-world analysis examples

### Key Concepts
- **Sherpa Agent Mode**: Thorough, self-questioning exploration approach
- **ADR Styles**: Technical, Business, Architectural, Implementation
- **Technical Spikes**: Focused research for architectural uncertainties
- **Pattern Recognition**: Automated identification of architectural patterns

## Your First Analysis

### Step 1: Choose Your Target Service
Select an Azure service you want to analyze (ADF, AKS, Synapse, etc.)

### Step 2: Set Up Analysis Environment
```bash
# Copy standards to your analysis workspace
cp -r azure-service-analysis-framework/standards/* /path/to/your/analysis/workspace/.github/

# Copy relevant examples
cp -r azure-service-analysis-framework/examples/[service]/* /path/to/your/analysis/workspace/examples/
```

### Step 3: Configure AI Assistant
Ensure your AI assistant can access the copilot-instructions.md file in your workspace.

### Step 4: Start Analysis
Use prompts like:
```
"Analyze the current state of [service/component] and identify architectural patterns"
"Generate a [style] ADR for [service/component] focusing on [aspect]"
```

## ADR Generation Workflow

### 1. Context Analysis
- Inventory all service components
- Identify integration points and dependencies
- Assess current architecture against best practices

### 2. Pattern Recognition
- Automated detection of common patterns
- Gap analysis against standards
- Opportunity identification

### 3. ADR Creation
- Choose appropriate ADR style for audience
- Use structured templates
- Include evidence-based recommendations

### 4. Spike Creation (if needed)
- Address architectural uncertainties
- Prototype solutions
- Validate assumptions

### 5. Azure DevOps Integration
- Create work items for ADRs and spikes
- Link to project backlog
- Track implementation progress

## Service-Specific Guides

### Azure Data Factory (ADF)
- Focus: ETL/ELT pipeline analysis and optimization
- Key Components: Pipelines, data flows, datasets, linked services
- Common Patterns: Staging layers, incremental loading, error handling

### Azure Kubernetes Service (AKS)
- Focus: Container orchestration and microservices
- Key Components: Clusters, pods, services, ingress
- Common Patterns: Service mesh, scaling, security

### Azure Synapse Analytics
- Focus: Data warehousing and big data analytics
- Key Components: SQL pools, Spark pools, data flows
- Common Patterns: Data lake architecture, performance optimization

## Best Practices

### Analysis Quality
- **Depth**: Minimum 10,000 characters of documented reasoning
- **Evidence**: Support all conclusions with data and analysis
- **Patterns**: Identify 5+ reusable architectural patterns
- **Actionability**: Include specific implementation steps

### Documentation Standards
- **Markdown First**: All analysis in dedicated folders
- **Version Control**: Clear commit messages linking to ADRs
- **Visual Aids**: Use Mermaid diagrams for complex architectures
- **Stakeholder Formats**: Export to DOCX/PDF as needed

### Process Excellence
- **Iterative Refinement**: Revise conclusions as new evidence emerges
- **Cross-Validation**: Compare findings across similar components
- **Stakeholder Validation**: Regular check-ins with project teams
- **Knowledge Transfer**: Document for team adoption

## Troubleshooting

### Common Issues
- **AI Assistant Not Recognizing Instructions**: Ensure copilot-instructions.md is in .github/ folder
- **Inconsistent ADR Styles**: Reference templates in templates/adrs/
- **Missing Patterns**: Check standards/ folder for service-specific guidance
- **Integration Challenges**: Review examples/ for similar scenarios

### Getting Help
- Check existing examples in examples/ folder
- Review standards/ for best practices
- Create issues in the GitHub repository
- Join discussions for community support

## Next Steps

1. **Complete Your First Analysis**: Apply the framework to a real Azure service
2. **Contribute Back**: Share your ADRs and patterns with the community
3. **Extend the Framework**: Add support for new Azure services
4. **Automate Processes**: Create scripts for common analysis tasks

## Resources

- [ADR Best Practices](adr-best-practices.md)
- [Service-Specific Guides](../examples/)
- [Template Library](../templates/)
- [Standards Documentation](../standards/)</content>
<parameter name="filePath">c:\Users\david.blaszyk\azure-service-analysis-framework\docs\getting-started.md