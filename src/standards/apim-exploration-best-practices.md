# Azure API Management Exploration & ADR Generation Best Practices

## Overview

These instructions combine the Sherpa Agent approach (thorough, self-questioning reasoning) with structured ADR generation processes and workspace-agnostic Azure API Management (APIM) analysis frameworks. They provide best practices for exploring APIM configurations and generating Architecture Decision Records (ADRs) that drive informed API gateway and management decisions.

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

### Phase 1: APIM Context Analysis
**Objective**: Understand the Azure API Management workspace and identify architectural decisions needing ADRs.

**Steps**:
1. **Workspace Scanning**: Automatically inventory all APIs, products, policies, and subscriptions
2. **Pattern Recognition**: Identify API gateway patterns, policy configurations, and security approaches
3. **Gap Analysis**: Compare current state against API management best practices and requirements
4. **Decision Identification**: List 3-5 architectural decisions needing ADRs

**Sherpa Reasoning**: "What API management patterns do I see here? Are these following microservices gateway principles? What assumptions am I making about the API consumer and provider requirements?"

**Tools to Use**:
- `list_dir` on API definitions, policies, and product configurations
- `read_file` on policy XML, OpenAPI specs, and backend configurations
- `grep_search` for specific policy types, authentication, and transformation logic

### Phase 2: ADR Generation
**Objective**: Create focused ADRs using appropriate styles based on audience and purpose.

**ADR Style Selection**:
- **Technical ADR**: For developers/architects - deep policy and configuration details
- **Business ADR**: For executives/stakeholders - API marketplace value and monetization
- **Architectural ADR**: For enterprise architects - API gateway design and integration patterns
- **Implementation ADR**: For project managers - deployment and operational runbooks

**Structured ADR Template** (Adapt based on style):

```
# ADR [Number]: [Decision Title]

**Status**: [Proposed/Accepted/Deprecated]

**Context**
[Problem description, constraints, options - 100-200 words]

**User Story**
As [API provider/consumer], I need [goal], so that [benefit]

**Decision**
[Chosen option with rationale and alternatives - 100 words]

**Implementation Details**
[Policy examples, API configurations, product setup]

**Consequences**
[Benefits, drawbacks, mitigations - including performance and security impacts]

**Acceptance Criteria**
[8-10 measurable outcomes including API gateway performance benchmarks]

**Additional Notes**
[Next steps, monitoring setup, developer portal configuration]
```

**Sherpa Reasoning**: "Is this the right ADR style for this API gateway architecture? What assumptions am I making about API provider and consumer needs? Should I include more security policy analysis or focus on performance characteristics?"

### Phase 3: Technical Spike Creation
**Objective**: Address uncertainties through focused research and prototyping.

**When to Create Spikes**:
- Unknown API gateway performance under load
- Unclear policy effectiveness and security implications
- Uncertain API product and subscription model viability
- New policy or transformation evaluation

**Spike Format**:
```
User Story: As [team/role], I need to [research task], so that [resolve uncertainty]

Acceptance Criteria:
- [4-6 measurable outcomes including API metrics]
- Timebox: [4-8 hours]

Implementation Notes:
- [Research approach, load testing, policy testing setup]
```

**Sherpa Reasoning**: "What exactly is uncertain about this APIM implementation? How can I design a spike that will definitively answer performance and security questions?"

### Phase 4: Azure DevOps Integration
**Objective**: Track ADRs and spikes as work items for project management.

**Work Item Hierarchy**:
- **Epic**: API Management area (e.g., "API Gateway Modernization")
- **Feature**: ADR topic (e.g., "API Security Policy Framework")
- **User Story**: ADR implementation or spike
- **Task**: Specific implementation steps

**Required Fields**:
- Title: ADR/Spike title
- Description: Full ADR text or spike details
- Acceptance Criteria: From ADR/spike
- Tags: "ADR", "Spike", "APIM", "APIGateway"
- Links: Connect spikes to parent ADRs

**Sherpa Reasoning**: "How will this work item fit into the API management lifecycle? What dependencies exist with backend APIs and consumer applications?"

## Specific Prompts for APIM Exploration

### APIM Analysis Prompts
```
"Analyze the current state of [APIM instance] and identify API gateway architectural patterns"
"Compare [API product A] with [API product B] for consistency and monetization strategy"
"Identify policy patterns and security configurations across this APIM instance"
"Assess API gateway performance and throttling characteristics"
```

### ADR Generation Prompts
```
"Generate a technical ADR for [APIM instance] focusing on policy design and implementation"
"Generate a business ADR for [APIM instance] emphasizing API marketplace value and ROI"
"Generate an architectural ADR for [APIM instance] analyzing gateway patterns"
"Generate an implementation ADR for [APIM instance] with deployment and monitoring setup"
```

### Customization Prompts
```
"Include API security policy analysis in the ADR for [APIM instance]"
"Focus on API versioning and deprecation patterns in the ADR"
"Compare API gateway vs service mesh for [microservices architecture]"
"Add API analytics and developer portal recommendations to the ADR"
```

### Technical Spike Prompts
```
"Create a spike to evaluate API gateway performance under [load conditions]"
"Research policy effectiveness for [security/transformation] requirements"
"Prototype [API product model] and compare with existing implementation"
"Investigate integration challenges between [APIM] and [backend services]"
```

### Azure DevOps Prompts
```
"Create work items for this ADR and related API gateway optimization spikes"
"Map this ADR to the API management backlog and sprint planning"
"Link this spike to dependent APIs and policy testing"
"Generate acceptance criteria for API gateway performance optimization tasks"
```

## Best Practices for Effective Exploration

### 1. Documentation Standards
- **OpenAPI First**: All APIs documented with comprehensive OpenAPI specifications
- **Version Control**: Clear commit messages linking to APIM deployments
- **Stakeholder Formats**: Export to DOCX/PDF for different audiences
- **C4 Diagrams**: Use system context, container, component, and code views for API gateway

### 2. Quality Assurance
- **Code Review Checklist**: Validate against API Management best practices
- **Pattern Recognition**: Identify common gateway, security, and monetization patterns
- **Performance Benchmarks**: Establish measurable metrics for latency and throughput
- **Security Assessment**: Evaluate authentication, authorization, and threat protection

### 3. Research Methodology
- **First Principles**: Break down API gateway problems to fundamental routing and policy components
- **Evidence-Based**: Support all conclusions with performance data and API analytics
- **Iterative Refinement**: Revise conclusions as new usage patterns emerge
- **Cross-Validation**: Compare findings across multiple APIs and products

### 4. Communication Strategies
- **Audience Adaptation**: Tailor ADR style and depth to recipient needs (devs vs business)
- **Visual Aids**: Use flow diagrams for complex policy chains and API routing
- **Executive Summaries**: Provide high-level overviews with drill-down technical details
- **Actionable Recommendations**: Include specific, measurable next steps with migration impacts

### 5. Tool Integration
- **Azure DevOps**: Use for work item tracking and API release management
- **Git Integration**: Maintain ADR history alongside APIM configurations
- **Testing Frameworks**: Validate ADR recommendations through automated API tests
- **Monitoring Tools**: Establish baselines for performance, usage, and security

## Common APIM Exploration Scenarios

### Scenario 1: New APIM Implementation
**Prompt**: "Analyze this new Azure API Management instance and generate a technical ADR"
**Process**:
1. Inventory all APIs, products, policies, and developer portal configurations
2. Assess architectural patterns and API gateway design compliance
3. Identify optimization opportunities and integration risks
4. Generate ADR with implementation recommendations

### Scenario 2: API Gateway Performance Optimization
**Prompt**: "Generate an implementation ADR for optimizing [APIM instance] performance"
**Process**:
1. Analyze current performance metrics and gateway bottlenecks
2. Research optimization techniques (caching, response compression, etc.)
3. Create spike for testing optimization approaches
4. Generate ADR with phased implementation plan

### Scenario 3: API Security and Policy Framework
**Prompt**: "Generate an architectural ADR for [APIM instance] security policy framework"
**Process**:
1. Analyze current security policies and threat protection measures
2. Design comprehensive security policy framework
3. Research industry best practices for API security
4. Generate ADR with security implementation and monitoring recommendations

### Scenario 4: API Marketplace and Monetization
**Prompt**: "Generate a business ADR for [APIM instance] API marketplace monetization strategy"
**Process**:
1. Analyze current API usage patterns and developer engagement
2. Design API product and subscription models
3. Research monetization best practices and pricing strategies
4. Generate ADR with marketplace implementation and business model recommendations

## Success Metrics

### Exploration Quality
- **Depth of Analysis**: Minimum 10,000 characters of documented reasoning
- **Assumption Validation**: All major assumptions about API gateway design explicitly tested
- **Pattern Recognition**: Identification of 5+ reusable API management architectural patterns
- **Recommendation Actionability**: 80% of recommendations include specific implementation steps

### ADR Quality
- **Completeness**: All template sections filled with relevant API gateway context
- **Audience Appropriateness**: ADR style matches intended audience needs
- **Evidence-Based**: All decisions supported by usage data and performance metrics
- **Implementation Readiness**: Clear acceptance criteria and operational runbooks

### Process Efficiency
- **Research Coverage**: Use of APIM analytics, testing tools, and developer feedback
- **Documentation Standards**: Consistent formatting and version control
- **Stakeholder Alignment**: Regular validation with API providers and consumers
- **Knowledge Transfer**: Clear documentation for team adoption of API management patterns

## Continuous Improvement

### Learning from Experience
- **Post-Implementation Review**: Analyze ADR accuracy and API adoption outcomes
- **Pattern Library**: Build reusable API gateway patterns from successful ADRs
- **Tool Enhancement**: Refine prompts and processes based on API evolution outcomes
- **Team Feedback**: Incorporate stakeholder input for API management improvement

### Scaling Best Practices
- **Template Customization**: Adapt ADR templates for different API types (internal, external, partner)
- **Automation Opportunities**: Identify repetitive tasks for policy and API deployment
- **Knowledge Base**: Maintain searchable repository of ADRs and performance benchmarks
- **Training Materials**: Develop guides for API management and gateway best practices

---

## Quick Reference Guide

### Key Prompts by Scenario
- **New Analysis**: "Analyze [APIM instance] and generate [style] ADR"
- **Optimization**: "Generate implementation ADR for [performance/security] optimization"
- **Comparison**: "Compare [policy A] with [policy B] in ADR format"
- **Research**: "Create spike to investigate [gateway/performance] uncertainty"

### ADR Style Decision Tree
- Technical audience + deep details → Technical ADR
- Business stakeholders + ROI focus → Business ADR
- System architects + design focus → Architectural ADR
- Project managers + execution focus → Implementation ADR

### Quality Checklist
- [ ] Thorough exploration (10k+ characters reasoning)
- [ ] All assumptions about API gateway design questioned and validated
- [ ] Evidence-based conclusions with usage data
- [ ] Actionable recommendations with security analysis
- [ ] Stakeholder-appropriate format
- [ ] Complete ADR template with API gateway context
- [ ] Work items created in Azure DevOps</content>
<parameter name="filePath">C:\Users\david.blaszyk\source\repos\azure-analysis\standards\apim-exploration-best-practices.md