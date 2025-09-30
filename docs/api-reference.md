# API Reference

This document provides a reference for the Azure Service Analysis Framework components, scripts, and integration points.

## Core Components

### AI Assistant Integration

#### Copilot Instructions (.github/copilot-instructions.md)
**Purpose**: Configures AI assistants for workspace-agnostic Azure service analysis

**Key Features**:
- Sherpa Agent mode for thorough exploration
- Automatic workspace context adaptation
- Multi-style ADR generation
- Pattern recognition and gap analysis

**Configuration**:
- Place in `.github/` folder of analysis workspace
- Compatible with GitHub Copilot, Continue.dev, CodeGPT
- Service-agnostic design works with any Azure service

### Standards & Methodologies

#### ADR Best Practices (standards/adr-best-practices.md)
**Purpose**: Guidelines for creating high-quality Architecture Decision Records

**Content**:
- ADR structure and formatting standards
- Evidence-based decision making
- Stakeholder communication strategies
- Quality assurance checklists

#### ADF Exploration Best Practices (standards/adf-exploration-best-practices.md)
**Purpose**: Specialized methodology for Azure Data Factory analysis

**Components**:
- Pipeline architecture analysis
- Data flow transformation patterns
- Dataset and linked service evaluation
- Performance optimization frameworks

#### Universal Analysis Framework (standards/azure-service-analysis-framework.md)
**Purpose**: Generic methodology applicable to any Azure service

**Methodology**:
- Component inventory and categorization
- Integration pattern analysis
- Security and compliance assessment
- Scalability and performance evaluation

### Templates

#### ADR Templates (templates/adrs/)
**Technical ADR Template**: Deep technical analysis with implementation details
**Business ADR Template**: Business value and ROI focus
**Architectural ADR Template**: System design and integration patterns
**Implementation ADR Template**: Step-by-step execution guidance

#### Spike Templates (templates/spikes/)
**Technical Spike Template**: Focused research for architectural uncertainties
**Proof of Concept Template**: Prototype validation framework
**Performance Spike Template**: Performance testing and optimization

### Scripts & Automation

#### PowerShell Scripts (scripts/*.ps1)
```powershell
# Generate ADR from analysis
.\scripts\generate-adr.ps1 -Service "adf" -Style "technical" -Name "MyAnalysis"

# Analyze service components
.\scripts\analyze-service.ps1 -Service "adf" -Path "C:\workspace" -Output "analysis.json"

# Compare implementations
.\scripts\compare-implementations.ps1 -Source "legacy" -Target "optimized" -Service "adf"
```

#### Bash Scripts (scripts/*.sh)
```bash
# Interactive ADR generation
./scripts/generate-adr.sh --interactive --service adf

# Batch analysis
./scripts/batch-analyze.sh --service aks --clusters "prod,staging,dev"
```

## Integration Points

### Azure DevOps Integration
- **Work Item Creation**: Automatic ADR and spike work item generation
- **Backlog Management**: Integration with project backlogs and sprints
- **Pipeline Integration**: CI/CD pipeline analysis and optimization
- **Repository Management**: Git-based versioning and change tracking

### Stakeholder Tools
- **DOCX Export**: Microsoft Word format for business stakeholders
- **PDF Generation**: Portable documentation for formal reviews
- **Mermaid Diagrams**: Visual architecture representations
- **PowerPoint Export**: Presentation-ready analysis summaries

### Development Tools
- **VS Code Extensions**: Native integration with development environment
- **GitHub Integration**: Repository-based collaboration and review
- **Azure Portal Integration**: Direct links to service configurations
- **Monitoring Integration**: Application Insights and Log Analytics correlation

## Data Structures

### Analysis Results
```json
{
  "service": "adf",
  "components": {
    "pipelines": ["pipeline1", "pipeline2"],
    "dataflows": ["flow1", "flow2"],
    "datasets": ["dataset1", "dataset2"],
    "linkedServices": ["service1", "service2"]
  },
  "patterns": {
    "staging": true,
    "incremental": true,
    "errorHandling": false
  },
  "recommendations": [
    {
      "type": "performance",
      "priority": "high",
      "description": "Implement partitioning strategy"
    }
  ],
  "adr": {
    "style": "technical",
    "content": "markdown content..."
  }
}
```

### ADR Metadata
```json
{
  "id": "ADR-001",
  "title": "Pipeline Architecture Analysis",
  "service": "adf",
  "style": "technical",
  "author": "AI Assistant",
  "date": "2024-01-15",
  "status": "approved",
  "tags": ["performance", "scalability", "integration"],
  "related": ["ADR-002", "SPIKE-001"]
}
```

## Configuration Files

### Workspace Configuration
```json
{
  "framework": {
    "version": "1.0.0",
    "service": "adf",
    "analysisDepth": "comprehensive"
  },
  "ai": {
    "assistant": "copilot",
    "mode": "sherpa",
    "qualityThreshold": 10000
  },
  "output": {
    "formats": ["markdown", "docx", "pdf"],
    "location": "./Analysis/"
  }
}
```

### Service-Specific Configuration
```json
{
  "adf": {
    "componentTypes": ["pipeline", "dataflow", "dataset", "linkedService"],
    "analysisPatterns": ["staging", "incremental", "error-handling"],
    "performanceMetrics": ["throughput", "latency", "cost"]
  }
}
```

## Error Handling

### Common Error Codes
- **E001**: Workspace not found or inaccessible
- **E002**: Service type not supported
- **E003**: AI assistant not configured
- **E004**: Template not found
- **E005**: Analysis depth below minimum threshold

### Recovery Procedures
1. **Validate Configuration**: Check .github/copilot-instructions.md placement
2. **Verify Permissions**: Ensure Azure service access and API permissions
3. **Check Dependencies**: Validate required tools and scripts are available
4. **Review Logs**: Examine analysis logs for detailed error information
5. **Retry with Reduced Scope**: Start with smaller analysis scope if needed

## Performance Considerations

### Analysis Time Guidelines
- **Small Service**: < 5 minutes (single pipeline, basic analysis)
- **Medium Service**: 5-15 minutes (multiple pipelines, comprehensive analysis)
- **Large Service**: 15-60 minutes (enterprise-scale, full ADR generation)

### Optimization Strategies
- **Incremental Analysis**: Analyze components individually then aggregate
- **Caching**: Cache Azure API responses for repeated analysis
- **Parallel Processing**: Analyze independent components concurrently
- **Selective Depth**: Adjust analysis depth based on requirements

## Security & Compliance

### Data Handling
- **No Secrets Storage**: Framework never stores Azure credentials or secrets
- **Read-Only Analysis**: All analysis operations are read-only
- **Audit Logging**: Comprehensive logging of all analysis activities
- **Compliance Checks**: Built-in compliance validation against standards

### Access Requirements
- **Azure Portal Access**: Read access to target services
- **Git Repository Access**: Push access for ADR creation
- **Azure DevOps Access**: Work item creation permissions (optional)
- **Local File System**: Write access to analysis workspace