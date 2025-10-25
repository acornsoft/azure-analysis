# Enhanced Requirements Template - Integration Guide

## Overview
The ADR toolkit's requirements template has been enhanced with a comprehensive User Story format that includes detailed business context, scenarios, acceptance criteria, and story point breakdowns. This provides a complete requirements analysis framework for complex business requirements.

## Files in This Directory

- **`template.md`** - Enhanced requirements template with User Story format
- **`example.md`** - Comprehensive example showing enterprise security requirements
- **`prompts.md`** - Detailed guidance and prompts for filling out templates
- **`README.md`** - This integration guide
- **`User-Story-Template-Enhanced.md`** - Standalone User Story template
- **`User-Story-Example-Enhanced-Format.md`** - Example of enhanced User Story format
- **`User-Story-Enhanced-Format-Guide.md`** - Complete guide for using enhanced format

## User Story Guidelines

The enhanced requirements template includes comprehensive User Story guidelines that can be used independently or as part of requirements analysis:

### Standalone User Story Documents
- **`User-Story-Template-Enhanced.md`** - Complete template for creating detailed user stories
- **`User-Story-Example-Enhanced-Format.md`** - Practical example showing the format in action
- **`User-Story-Enhanced-Format-Guide.md`** - Step-by-step guide for using the enhanced format

### When to Use Standalone User Stories
- **Feature Development**: Detailed user story documentation for new features
- **Bug Fixes**: Structured analysis of issues and required fixes
- **Enhancements**: Documentation of system improvements
- **Integration Requirements**: Complex system integration scenarios

### Integration with Requirements Analysis
The User Story format is fully integrated into the requirements template (`template.md`) in the "User Stories with Story Points" section, allowing you to break down complex requirements into implementable user stories with effort estimates.

## What Was Enhanced

### 1. **Template Structure** (`template.md`)
- Added **Business Context** section for strategic justification
- Enhanced **Scenarios** with more detailed Given/When/Then format
- Improved **Acceptance Criteria** with functional/non-functional separation
- Added **User Stories with Story Points** section for implementation breakdown
- Included **Related Documentation** section for traceability

### 2. **Guidance** (`prompts.md`)
- Added prompts for the new Business Context section
- Enhanced guidance for User Stories with Story Points
- Moved detailed story pointing guidelines to dedicated sections
- Added Azure-specific story point considerations

### 3. **Example** (`example.md`)
- Updated with comprehensive enterprise security requirement example
- Shows complete breakdown with story points and technical details
- Demonstrates the enhanced format in practice

## How to Use the Enhanced Template

### 1. **Generate Requirements Document**
Use the ADR toolkit to generate a new requirements document:
```bash
# From the adr-toolkit directory
./Generate-Partner-ADR.ps1 -Type requirements -Title "Your Requirement Title"
```

### 2. **Fill Out Sections in Order**
1. **Description**: Business-focused overview (2-3 paragraphs)
2. **User Story**: Primary "As a... I want... So that..." statement
3. **Business Context**: Strategic justification and stakeholder impact
4. **Scenarios**: 3 detailed scenarios covering main path, alternatives, and edge cases
5. **Acceptance Criteria**: Functional and non-functional requirements documented as detailed scenarios with Given/When/Then format
6. **Technical Detail**: Implementation approach and technical considerations
7. **User Stories with Story Points**: Break down into implementable stories (SP 1, 2, 5)
8. **Related Documentation**: Links to supporting documents

### 3. **Story Point Estimation**
Use the guidelines in `prompts.md`:
- **SP 1 (2-6 hours)**: Simple, well-understood tasks
- **SP 2 (4-10 hours)**: Moderate complexity with some integration
- **SP 5 (12-25 hours)**: Complex tasks requiring significant analysis/design

### 4. **Integration with ADR Process**
- Requirements documents can reference ADRs for architectural decisions
- ADRs can reference requirements documents for business context
- Use the toolkit's cross-referencing capabilities

## Benefits of Enhanced Format

### For Business Stakeholders
- **Clear Business Context**: Understand strategic importance and expected outcomes
- **Detailed Scenarios**: See concrete examples of how features will work
- **Measurable Acceptance Criteria**: Know exactly what success looks like

### For Technical Teams
- **Implementation Guidance**: Technical details separate from business requirements
- **Sized User Stories**: Clear breakdown of work with effort estimates
- **Dependencies Identified**: Risks and assumptions documented upfront

### For Project Management
- **Complete Requirements**: All aspects covered in single document
- **Traceability**: Links to related documents and ADRs
- **Planning Foundation**: Story points enable accurate sprint planning

## Migration from Existing Requirements

If you have existing requirements documents, enhance them by:
1. Adding the Business Context section
2. Expanding scenarios with more detail
3. Breaking down into sized user stories
4. Adding technical details and dependencies

## Azure-Specific Considerations

The template includes Azure-focused guidance for:
- **Azure Data Factory**: ETL pipeline requirements
- **Azure Functions**: Serverless and API requirements
- **Integration Patterns**: Event-driven, API, and data processing scenarios

## Best Practices

### Document Creation
- **Collaborate**: Involve business and technical stakeholders
- **Iterate**: Start simple and refine based on feedback
- **Validate**: Ensure acceptance criteria are measurable

### Story Point Estimation
- **Team Consensus**: Discuss estimates as a team
- **Relative Sizing**: Compare to previously completed stories
- **Include All Aspects**: Analysis, development, testing, documentation

### Maintenance
- **Keep Current**: Update as requirements evolve
- **Version Control**: Track changes in git
- **Cross-Reference**: Link to related ADRs and design documents

## Example Usage Scenarios

### Enterprise Integration Requirements
- Data migration projects
- System consolidation initiatives
- API integration requirements
- Security compliance enhancements

### Application Development Requirements
- New feature development
- System enhancements
- User experience improvements
- Performance optimization

### Infrastructure Requirements
- Cloud migration projects
- Security enhancements
- Monitoring and alerting
- Disaster recovery planning

## Support and Training

The enhanced template includes comprehensive guidance in the `prompts.md` file. For training on the new format:

1. Review the example document (`example.md`)
2. Study the prompts and guidance (`prompts.md`)
3. Practice with a small requirement
4. Get feedback from team members

## Future Enhancements

The template can be further customized for specific domains:
- Add domain-specific scenario templates
- Include industry-specific compliance requirements
- Add integration patterns for common technologies
- Create checklists for different requirement types

---

*This enhanced requirements template provides a comprehensive framework for capturing, documenting, and managing complex business requirements with clear implementation guidance.*</content>
<parameter name="filePath">c:\Users\david.blaszyk\com.avanade.partner\ecolab\src\azure-analysis\src\adr-toolkit\types\requirements\README.md