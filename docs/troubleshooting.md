# Troubleshooting Guide

This guide helps resolve common issues when using the Azure Service Analysis Framework.

## AI Assistant Issues

### Problem: AI Assistant Not Recognizing Instructions
**Symptoms**: AI assistant doesn't generate ADRs or follow framework patterns

**Solutions**:
1. **Verify File Location**: Ensure `copilot-instructions.md` is in `.github/` folder
2. **Check File Permissions**: AI assistant must be able to read the instructions file
3. **Restart AI Assistant**: Reload VS Code or restart the AI assistant extension
4. **Validate Content**: Ensure the instructions file wasn't corrupted during copy

**Prevention**: Always copy the entire `.github/` folder structure to new workspaces

### Problem: Inconsistent ADR Styles
**Symptoms**: ADRs generated don't match requested style (technical vs business)

**Solutions**:
1. **Specify Style Explicitly**: Use prompts like "Generate a technical ADR for [component]"
2. **Check Template Access**: Ensure ADR templates are accessible in workspace
3. **Update Instructions**: Copy latest `copilot-instructions.md` from framework repository
4. **Clear AI Cache**: Restart AI assistant to clear any cached instructions

### Problem: Analysis Too Shallow
**Symptoms**: Generated analysis lacks depth or misses important patterns

**Solutions**:
1. **Enable Sherpa Mode**: Use "Sherpa Agent" prompts for thorough exploration
2. **Increase Scope**: Analyze entire service instead of individual components
3. **Add Context**: Provide more background about business requirements
4. **Iterate Analysis**: Ask follow-up questions to deepen understanding

## Azure Service Access Issues

### Problem: Cannot Access Azure Resources
**Symptoms**: Analysis fails due to permission errors

**Solutions**:
1. **Check Azure Permissions**: Ensure Reader role on target resource group
2. **Validate Subscription**: Confirm correct subscription is selected
3. **Test Portal Access**: Verify you can access resources in Azure portal
4. **Update Credentials**: Refresh Azure CLI or portal authentication

**Required Permissions**:
- Azure Data Factory: Data Factory Contributor (or Reader for analysis)
- Azure Kubernetes Service: Azure Kubernetes Service Cluster User Role
- Azure Synapse: Synapse User or Contributor role

### Problem: Service Components Not Detected
**Symptoms**: Analysis misses pipelines, clusters, or other components

**Solutions**:
1. **Verify Resource Location**: Check if resources are in expected resource group
2. **Check Naming Patterns**: Ensure component names follow expected conventions
3. **Update Framework**: Use latest version of analysis framework
4. **Manual Inventory**: Provide component list manually if auto-detection fails

## File and Workspace Issues

### Problem: Files Not Copied Correctly
**Symptoms**: Missing templates, standards, or example files

**Solutions**:
1. **Use Correct Copy Commands**:
   ```bash
   # Windows PowerShell
   Copy-Item -Path "framework\standards\*" -Destination "workspace\.github\" -Recurse

   # Linux/macOS
   cp -r framework/standards/* workspace/.github/
   ```
2. **Check File Paths**: Ensure source and destination paths are correct
3. **Verify Permissions**: Confirm write access to destination directory
4. **Validate Copy**: Check file counts match between source and destination

### Problem: Workspace Structure Not Recognized
**Symptoms**: Framework doesn't adapt to project layout

**Solutions**:
1. **Standardize Structure**: Organize workspace with standard Azure project layout
2. **Update Instructions**: Use latest copilot-instructions.md with improved adaptation
3. **Manual Configuration**: Specify component locations explicitly in analysis prompts
4. **Custom Instructions**: Create workspace-specific instructions if needed

## ADR Generation Issues

### Problem: ADR Format Inconsistent
**Symptoms**: Generated ADRs don't follow standard structure

**Solutions**:
1. **Use Templates**: Reference specific ADR templates in prompts
2. **Specify Format**: Include "using the standard ADR template" in prompts
3. **Review Examples**: Compare with examples in framework repository
4. **Manual Editing**: Edit generated ADR to match standard format

### Problem: Missing Sections in ADR
**Symptoms**: Important sections like recommendations or analysis are missing

**Solutions**:
1. **Be Specific**: Use detailed prompts like "Include implementation recommendations"
2. **Use Follow-ups**: Ask AI to "Add the missing [section] to the ADR"
3. **Check Quality**: Ensure analysis meets minimum depth requirements
4. **Template Reference**: Explicitly reference template sections

## Performance Issues

### Problem: Analysis Takes Too Long
**Symptoms**: ADR generation or analysis runs for extended periods

**Solutions**:
1. **Reduce Scope**: Analyze individual components instead of entire service
2. **Use Incremental**: Generate analysis in phases
3. **Optimize Prompts**: Be more specific about what to analyze
4. **Check Resources**: Ensure adequate compute resources for large analyses

### Problem: Memory Issues During Analysis
**Symptoms**: AI assistant crashes or becomes unresponsive

**Solutions**:
1. **Split Analysis**: Break large services into smaller analysis sessions
2. **Clear Cache**: Restart AI assistant to free memory
3. **Reduce Context**: Limit the amount of code/context provided
4. **Use Streaming**: Generate ADR sections individually

## Integration Issues

### Problem: Azure DevOps Work Items Not Created
**Symptoms**: ADRs generated but no corresponding work items

**Solutions**:
1. **Check Permissions**: Verify Azure DevOps project permissions
2. **Validate Connection**: Test Azure DevOps extension connectivity
3. **Manual Creation**: Create work items manually from generated ADRs
4. **Update Integration**: Ensure latest integration scripts are used

### Problem: Export Formats Not Working
**Symptoms**: Cannot export to DOCX, PDF, or other formats

**Solutions**:
1. **Install Dependencies**: Ensure required export tools are installed
   ```bash
   # For DOCX export
   npm install -g pandoc

   # For PDF export
   npm install -g markdown-pdf
   ```
2. **Check Templates**: Verify export templates are present
3. **Validate Input**: Ensure markdown is well-formed
4. **Use Alternatives**: Export manually using VS Code extensions

## Service-Specific Issues

### Azure Data Factory Issues

#### Problem: Pipeline Dependencies Not Recognized
**Solutions**:
1. **Check Triggers**: Ensure pipeline triggers are properly configured
2. **Validate Datasets**: Verify dataset references are correct
3. **Review Linked Services**: Check linked service connections
4. **Manual Mapping**: Provide dependency map if auto-detection fails

#### Problem: Data Flow Analysis Incomplete
**Solutions**:
1. **Access Data Flows**: Ensure read access to data flow definitions
2. **Check Complexity**: Very complex flows may need manual analysis
3. **Use Sampling**: Analyze representative data flows first
4. **Iterate Analysis**: Build understanding incrementally

### Azure Kubernetes Service Issues

#### Problem: Cluster Components Not Detected
**Solutions**:
1. **Check RBAC**: Ensure proper cluster access permissions
2. **Validate Context**: Confirm correct kubectl context is set
3. **Test Connectivity**: Verify cluster connectivity from analysis environment
4. **Manual Inventory**: Provide component list if auto-detection fails

### Azure Synapse Issues

#### Problem: Workspace Analysis Limited
**Solutions**:
1. **Check Permissions**: Ensure Synapse workspace access
2. **Validate Components**: Verify SQL pools, Spark pools are accessible
3. **Use Portal**: Cross-reference with Azure portal information
4. **Iterate Scope**: Analyze individual components separately

## Framework Update Issues

### Problem: Outdated Framework Version
**Symptoms**: Missing features or inconsistent behavior

**Solutions**:
1. **Check Version**: Compare local version with repository
2. **Update Files**: Copy latest standards and templates
3. **Review Changelog**: Check for breaking changes
4. **Test Updates**: Validate with existing analyses

### Problem: Custom Modifications Lost
**Symptoms**: Local changes overwritten during updates

**Solutions**:
1. **Backup Changes**: Save custom modifications before updating
2. **Use Git**: Track local changes in separate branch
3. **Merge Carefully**: Manually merge customizations with updates
4. **Document Changes**: Keep record of local modifications

## Getting Help

### Community Resources
- **GitHub Issues**: Search existing issues and create new ones
- **Discussions**: Join community discussions for advice
- **Wiki**: Check framework documentation and examples
- **Examples**: Review working examples in the repository

### Diagnostic Information
When reporting issues, include:
- Framework version and commit hash
- AI assistant type and version
- Azure service and component details
- Error messages and logs
- Steps to reproduce the issue

### Emergency Workarounds
- **Manual Analysis**: Perform analysis manually using framework guidelines
- **Simplified Prompts**: Use basic prompts without advanced features
- **Direct AI Queries**: Ask AI assistant directly without framework
- **Offline Mode**: Use framework templates without AI assistance