# ADF Pipeline Exploration & ADR Generation Best Practices

## Overview

These instructions combine the Sherpa Agent approach (thorough, self-questioning reasoning) with structured ADR generation processes and workspace-agnostic ADF analysis frameworks. They provide best practices for exploring Azure Data Factory (ADF) pipelines and generating Architecture Decision Records (ADRs) that drive informed architectural decisions.

## Core Principles (Sherpa Agent Mode)

1. **Exploration over Conclusion**
   - Never rush to conclusions; let solutions emerge naturally from evidence
   - Question every assumption and inference continuously
   - Embrace uncertainty and revision of previous thoughts
   - If uncertain, continue reasoning indefinitely

2. **Depth of Reasoning**
   - Engage in extensive contemplation (minimum 10,000 characters per complex analysis)
   - Express thoughts in natural conversational internal monologue
   - Break down complex thoughts into simple atomic steps
   - Show work-in-progress thinking and acknowledge dead ends

3. **Thinking Process**
   - Use short, simple sentences to mirror natural thought patterns
   - Express uncertainty and internal debate freely
   - Frequently backtrack and revise previous conclusions
   - Value thorough exploration over quick resolution

4. **Persistence**
   - Keep exploring until a solution emerges naturally
   - Document all thought processes and revisions
   - Acknowledge and explore dead ends before moving forward

## Exploration Process

### Phase 1: Project Context Analysis
**Objective**: Understand the ADF workspace and identify architectural decisions needing ADRs.

**Steps**:
1. **Workspace Scanning**: Automatically inventory all pipelines, dataflows, datasets, and linked services
2. **Pattern Recognition**: Identify ETL patterns, error handling, and integration approaches
3. **Gap Analysis**: Compare current state against best practices and requirements
4. **Decision Identification**: List 3-5 architectural decisions needing ADRs

**Sherpa Reasoning**: "What patterns do I see here? Are these standard ETL approaches or custom implementations? What assumptions am I making about the data flow complexity?"

**Tools to Use**:
- `list_dir` on pipeline/, dataflow/, dataset/, linkedService/ folders
- `read_file` on key components for pattern analysis
- `grep_search` for specific transformation logic

### Phase 2: ADR Generation
**Objective**: Create focused ADRs using appropriate styles based on audience and purpose.

**ADR Style Selection**:
- **Technical ADR**: For developers/architects - deep implementation details
- **Business ADR**: For executives/stakeholders - business value and ROI
- **Architectural ADR**: For enterprise architects - system design and scalability
- **Implementation ADR**: For project managers - execution plans and timelines

**Structured ADR Template** (Adapt based on style):

```
# ADR [Number]: [Decision Title]

**Status**: [Proposed/Accepted/Deprecated]

**Context**
[Problem description, constraints, options - 100-200 words]

**User Story**
As [role], I need [goal], so that [benefit]

**Decision**
[Chosen option with rationale and alternatives - 100 words]

**Implementation Details**
[Steps, examples, prototypes - include code samples]

**Consequences**
[Benefits, drawbacks, mitigations]

**Acceptance Criteria**
[8-10 measurable outcomes]

**Additional Notes**
[Next steps, CI commands, references]
```

**Sherpa Reasoning**: "Is this the right ADR style for this audience? What assumptions am I making about their needs? Should I include more technical details or focus on business impact?"

### Phase 3: Technical Spike Creation
**Objective**: Address uncertainties through focused research and prototyping.

**When to Create Spikes**:
- Unknown scalability requirements
- Unclear integration patterns
- Uncertain performance characteristics
- New technology evaluation

**Spike Format**:
```
User Story: As [team/role], I need to [research task], so that [resolve uncertainty]

Acceptance Criteria:
- [4-6 measurable outcomes]
- Timebox: [4-8 hours]

Implementation Notes:
- [Research approach, tools, prototypes]
```

**Sherpa Reasoning**: "What exactly is uncertain here? How can I design a spike that will definitively answer this question? What biases might I have in my approach?"

### Phase 4: Azure DevOps Integration
**Objective**: Track ADRs and spikes as work items for project management.

**Work Item Hierarchy**:
- **Epic**: Project area (e.g., "ADF Pipeline Modernization")
- **Feature**: ADR topic (e.g., "Data Flow Optimization")
- **User Story**: ADR implementation or spike
- **Task**: Specific implementation steps

**Required Fields**:
- Title: ADR/Spike title
- Description: Full ADR text or spike details
- Acceptance Criteria: From ADR/spike
- Tags: "ADR", "Spike", "ADF", "Research"
- Links: Connect spikes to parent ADRs

**Sherpa Reasoning**: "How will this work item fit into the broader project structure? What dependencies exist? Am I capturing all necessary context for future reference?"

## Specific Prompts for ADF Exploration

### Workspace Analysis Prompts
```
"Analyze the current state of [pipeline name] and identify architectural patterns"
"Compare [pipeline A] with [pipeline B] for consistency and best practices"
"Identify integration points and dependencies in this ADF workspace"
"Assess data quality and governance patterns across datasets"
```

### ADR Generation Prompts
```
"Generate a technical ADR for [pipeline name] focusing on performance optimization"
"Generate a business ADR for [pipeline name] emphasizing ROI and stakeholder impact"
"Generate an architectural ADR for [pipeline name] analyzing scalability and integration patterns"
"Generate an implementation ADR for [pipeline name] with detailed migration steps"
```

### Customization Prompts
```
"Include security analysis in the ADR for [pipeline name]"
"Focus on error handling patterns in the ADR"
"Compare current implementation with industry best practices"
"Add cost analysis and optimization recommendations to the ADR"
```

### Technical Spike Prompts
```
"Create a spike to evaluate [technology/tool] for [specific use case]"
"Research scalability limits of [current pattern] under [conditions]"
"Prototype [new approach] and compare with existing implementation"
"Investigate integration challenges between [system A] and [system B]"
```

### Azure DevOps Prompts
```
"Create work items for this ADR and related spikes"
"Map this ADR to the project backlog and sprint planning"
"Link this spike to dependent features and user stories"
"Generate acceptance criteria for ADR implementation tasks"
```

## Best Practices for Effective Exploration

### 1. Documentation Standards
- **Markdown First**: All analysis in Analysis/ folder with Mermaid diagrams
- **Version Control**: Clear commit messages linking to ADRs
- **Stakeholder Formats**: Export to DOCX/PDF for different audiences
- **C4 Diagrams**: Use system context, container, component, and code views

### 2. Quality Assurance
- **Code Review Checklist**: Validate against ADF best practices
- **Pattern Recognition**: Identify common ETL, error handling, and integration patterns
- **Performance Benchmarks**: Establish measurable metrics for pipelines
- **Security Assessment**: Evaluate authentication, authorization, and data protection

### 3. Research Methodology
- **First Principles**: Break down complex problems to fundamental components
- **Evidence-Based**: Support all conclusions with data and analysis
- **Iterative Refinement**: Revise conclusions as new evidence emerges
- **Cross-Validation**: Compare findings across multiple pipelines and patterns

### 4. Communication Strategies
- **Audience Adaptation**: Tailor ADR style and depth to recipient needs
- **Visual Aids**: Use diagrams for complex architectural concepts
- **Executive Summaries**: Provide high-level overviews with drill-down details
- **Actionable Recommendations**: Include specific, measurable next steps

### 5. Tool Integration
- **Azure DevOps**: Use for work item tracking and project management
- **Git Integration**: Maintain ADR history and version control
- **Testing Frameworks**: Validate ADR recommendations through automated tests
- **Monitoring Tools**: Establish baselines for performance and reliability metrics

## Common ADF Exploration Scenarios

### Scenario 1: New Pipeline Analysis
**Prompt**: "Analyze this new ADF pipeline and generate a technical ADR"
**Process**: 
1. Inventory all components and dependencies
2. Assess architectural patterns and best practices compliance
3. Identify optimization opportunities and risks
4. Generate ADR with implementation recommendations

### Scenario 2: Performance Optimization
**Prompt**: "Generate an implementation ADR for optimizing [pipeline name] performance"
**Process**:
1. Analyze current performance metrics and bottlenecks
2. Research optimization techniques and best practices
3. Create spike for testing optimization approaches
4. Generate ADR with phased implementation plan

### Scenario 3: Integration Pattern Evaluation
**Prompt**: "Generate an architectural ADR comparing integration patterns in [workspace]"
**Process**:
1. Catalog all integration points and patterns
2. Evaluate consistency and scalability
3. Research industry best practices
4. Generate ADR with standardization recommendations

### Scenario 4: Migration Planning
**Prompt**: "Generate an implementation ADR for migrating [legacy system] to ADF"
**Process**:
1. Analyze legacy system architecture and data flows
2. Design ADF equivalent patterns
3. Create migration roadmap with risk mitigation
4. Generate ADR with detailed implementation phases

## Success Metrics

### Exploration Quality
- **Depth of Analysis**: Minimum 10,000 characters of documented reasoning
- **Assumption Validation**: All major assumptions explicitly tested and validated
- **Pattern Recognition**: Identification of 5+ reusable architectural patterns
- **Recommendation Actionability**: 80% of recommendations include specific implementation steps

### ADR Quality
- **Completeness**: All template sections filled with relevant content
- **Audience Appropriateness**: ADR style matches intended audience needs
- **Evidence-Based**: All decisions supported by research and analysis
- **Implementation Readiness**: Clear acceptance criteria and next steps

### Process Efficiency
- **Research Coverage**: Use of web_search, code_execution, and analysis tools
- **Documentation Standards**: Consistent formatting and version control
- **Stakeholder Alignment**: Regular validation with project stakeholders
- **Knowledge Transfer**: Clear documentation for team adoption

## Continuous Improvement

### Learning from Experience
- **Post-Implementation Review**: Analyze ADR accuracy and implementation success
- **Pattern Library**: Build reusable architectural patterns from successful ADRs
- **Tool Enhancement**: Refine prompts and processes based on outcomes
- **Team Feedback**: Incorporate stakeholder input for process improvement

### Scaling Best Practices
- **Template Customization**: Adapt ADR templates for different project types
- **Automation Opportunities**: Identify repetitive tasks for tool automation
- **Knowledge Base**: Maintain searchable repository of ADRs and patterns
- **Training Materials**: Develop guides for new team members

---

## Quick Reference Guide

### Key Prompts by Scenario
- **New Analysis**: "Analyze [component] and generate [style] ADR"
- **Optimization**: "Generate implementation ADR for [improvement area]"
- **Comparison**: "Compare [option A] with [option B] in ADR format"
- **Research**: "Create spike to investigate [uncertainty]"

### ADR Style Decision Tree
- Technical audience + deep details → Technical ADR
- Business stakeholders + ROI focus → Business ADR
- System architects + design focus → Architectural ADR
- Project managers + execution focus → Implementation ADR

### Quality Checklist
- [ ] Thorough exploration (10k+ characters reasoning)
- [ ] All assumptions questioned and validated
- [ ] Evidence-based conclusions
- [ ] Actionable recommendations
- [ ] Stakeholder-appropriate format
- [ ] Complete ADR template
- [ ] Work items created in Azure DevOps</content>
<parameter name="filePath">c:\Users\david.blaszyk\source\repos\Ecolab.Snowflake.Integrations\.github\prompts\adf-exploration-best-practices.md