# Example: Generate ADR with Mermaid Diagrams
# This script demonstrates how to use the enhanced Generate-Partner-ADR.ps1
# with automatic Mermaid diagram generation and conversion to images

# IMPORTANT: Run this script from your project root directory
# The script will automatically place files in Analysis\{Partner}\

# Basic usage with automatic diagram discovery
& ".\src\azure-analysis\src\adr-toolkit\Generate-Partner-ADR.ps1" `
    -Partner Accenture `
    -Client Ecolab `
    -Title "Customer Data Management Change Feed" `
    -GenerateDiagrams

# Advanced usage with specific diagram templates
& ".\src\azure-analysis\src\adr-toolkit\Generate-Partner-ADR.ps1" `
    -Partner Accenture `
    -Client Ecolab `
    -Title "System Architecture Overview" `
    -GenerateDiagrams `
    -DiagramTemplates @(
        ".\Analysis\diagrams\message-flow-diagram.mmd",
        ".\Analysis\diagrams\system-architecture.mmd"
    ) `
    -ImagesFolder "diagrams" `
    -GenerateAllFormats

# Usage with custom output path (if you need to override the default Partner folder)
& ".\src\azure-analysis\src\adr-toolkit\Generate-Partner-ADR.ps1" `
    -Partner Avanade `
    -Client "Carter-Machinery" `
    -Title "Infrastructure Migration Strategy" `
    -GenerateDiagrams `
    -OutputPath ".\Analysis\Avanade" `
    -ImagesFolder "visuals"