# Azure Web API Exploration & ADR Generation Best Practices

## Overview

These instructions combine the Sherpa Agent approach (thorough, self-questioning reasoning) with structured ADR generation processes and workspace-agnostic Azure Web API analysis frameworks. They provide best practices for exploring Azure Web API applications and generating Architecture Decision Records (ADRs) that drive informed API design and implementation decisions.

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

### Phase 1: API Context Analysis
**Objective**: Understand the Azure Web API workspace and identify architectural decisions needing ADRs.

**Steps**:
1. **Workspace Scanning**: Automatically inventory all API endpoints, controllers, models, and middleware
2. **Pattern Recognition**: Identify RESTful patterns, authentication, and integration approaches
3. **Gap Analysis**: Compare current state against API design best practices and requirements
4. **Decision Identification**: List 3-5 architectural decisions needing ADRs

**Sherpa Reasoning**: "What API patterns do I see here? Are these following RESTful conventions? What assumptions am I making about the client integration requirements?"

**Tools to Use**:
- `list_dir` on controllers, models, and middleware directories
- `read_file` on route definitions, swagger docs, and API controllers
- `grep_search` for specific HTTP methods, authentication, and validation logic

### Phase 2: ADR Generation
**Objective**: Create focused ADRs using appropriate styles based on audience and purpose.

**ADR Style Selection**:
- **Technical ADR**: For developers/architects - deep implementation details and code patterns
- **Business ADR**: For executives/stakeholders - business value and API adoption impact
- **Architectural ADR**: For enterprise architects - API design and integration patterns
- **Implementation ADR**: For project managers - deployment and API management runbooks

**Structured ADR Template** (Adapt based on style):

```
# ADR [Number]: [Decision Title]

**Status**: [Proposed/Accepted/Deprecated]

**Context**
[Problem description, constraints, options - 100-200 words]

**User Story**
As [API consumer/developer], I need [goal], so that [benefit]

**Decision**
[Chosen option with rationale and alternatives - 100 words]

**Implementation Details**
[API endpoint examples, request/response schemas, authentication setup]

**Consequences**
[Benefits, drawbacks, mitigations - including breaking change impacts]

**Acceptance Criteria**
[8-10 measurable outcomes including API performance benchmarks]

**Additional Notes**
[Next steps, API documentation, versioning strategy]
```

**Sherpa Reasoning**: "Is this the right ADR style for this API architecture? What assumptions am I making about consumer needs? Should I include more versioning strategy or focus on performance characteristics?"

### Phase 3: Technical Spike Creation
**Objective**: Address uncertainties through focused research and prototyping.

**When to Create Spikes**:
- Unknown API performance under load
- Unclear versioning strategy effectiveness
- Uncertain authentication and authorization patterns
- New API framework or middleware evaluation

**Spike Format**:
```
User Story: As [team/role], I need to [research task], so that [resolve uncertainty]

Acceptance Criteria:
- [4-6 measurable outcomes including API metrics]
- Timebox: [4-8 hours]

Implementation Notes:
- [Research approach, load testing, API monitoring setup]
```

**Sherpa Reasoning**: "What exactly is uncertain about this API implementation? How can I design a spike that will definitively answer performance and integration questions?"

### Phase 4: Azure DevOps Integration
**Objective**: Track ADRs and spikes as work items for project management.

**Work Item Hierarchy**:
- **Epic**: API area (e.g., "Customer API Modernization")
- **Feature**: ADR topic (e.g., "API Versioning Strategy")
- **User Story**: ADR implementation or spike
- **Task**: Specific implementation steps

**Required Fields**:
- Title: ADR/Spike title
- Description: Full ADR text or spike details
- Acceptance Criteria: From ADR/spike
- Tags: "ADR", "Spike", "WebAPI", "REST"
- Links: Connect spikes to parent ADRs

**Sherpa Reasoning**: "How will this work item fit into the API development lifecycle? What dependencies exist with consumer applications?"

## Specific Prompts for Azure Web API Exploration

### API Analysis Prompts
```
"Analyze the current state of [API name] and identify RESTful architectural patterns"
"Compare [API endpoint A] with [API endpoint B] for consistency and design principles"
"Identify authentication patterns and security configurations across this API"
"Assess API performance and scalability characteristics"
```

### ADR Generation Prompts
```
"Generate a technical ADR for [API name] focusing on endpoint design and implementation"
"Generate a business ADR for [API name] emphasizing adoption impact and ROI"
"Generate an architectural ADR for [API name] analyzing integration patterns"
"Generate an implementation ADR for [API name] with deployment and documentation setup"
```

### Customization Prompts
```
"Include API versioning analysis in the ADR for [API name]"
"Focus on authentication and authorization patterns in the ADR"
"Compare REST vs GraphQL vs gRPC for [API use case]"
"Add API monitoring and analytics recommendations to the ADR"
```

### Technical Spike Prompts
```
"Create a spike to evaluate API performance under [load conditions]"
"Research versioning strategy effectiveness for [API consumers]"
"Prototype [authentication pattern] and compare with existing implementation"
"Investigate integration challenges between [API] and [consumer application]"
```

### Azure DevOps Prompts
```
"Create work items for this ADR and related API optimization spikes"
"Map this ADR to the API development backlog and sprint planning"
"Link this spike to dependent endpoints and integration testing"
"Generate acceptance criteria for API performance optimization tasks"
```

## Best Practices for Effective Exploration

### 1. Documentation Standards
- **OpenAPI First**: All APIs documented with Swagger/OpenAPI specifications
- **Version Control**: Clear commit messages linking to API deployments
- **Stakeholder Formats**: Export to DOCX/PDF for different audiences
- **C4 Diagrams**: Use system context, container, component, and code views for APIs

### 2. Quality Assurance
- **Code Review Checklist**: Validate against RESTful API best practices
- **Pattern Recognition**: Identify common API design, security, and integration patterns
- **Performance Benchmarks**: Establish measurable metrics for response times and throughput
- **Security Assessment**: Evaluate authentication, authorization, and data validation

### 3. Research Methodology
- **First Principles**: Break down API problems to fundamental design and integration components
- **Evidence-Based**: Support all conclusions with performance data and consumer feedback
- **Iterative Refinement**: Revise conclusions as new usage patterns emerge
- **Cross-Validation**: Compare findings across multiple API endpoints and versions

### 4. Communication Strategies
- **Audience Adaptation**: Tailor ADR style and depth to recipient needs (devs vs business)
- **Visual Aids**: Use sequence diagrams for complex API interactions
- **Executive Summaries**: Provide high-level overviews with drill-down technical details
- **Actionable Recommendations**: Include specific, measurable next steps with migration impacts

### 5. Tool Integration
- **Azure DevOps**: Use for work item tracking and API release management
- **Git Integration**: Maintain ADR history alongside API code
- **Testing Frameworks**: Validate ADR recommendations through automated API tests
- **Monitoring Tools**: Establish baselines for performance, usage, and reliability

## Common Azure Web API Exploration Scenarios

### Scenario 1: New API Development
**Prompt**: "Analyze this new Azure Web API and generate a technical ADR"
**Process**:
1. Inventory all endpoints, models, and middleware components
2. Assess architectural patterns and RESTful design compliance
3. Identify optimization opportunities and integration risks
4. Generate ADR with implementation recommendations

### Scenario 2: API Performance Optimization
**Prompt**: "Generate an implementation ADR for optimizing [API name] performance"
**Process**:
1. Analyze current performance metrics and response time bottlenecks
2. Research optimization techniques (caching, async patterns, etc.)
3. Create spike for testing optimization approaches
4. Generate ADR with phased implementation plan

### Scenario 3: API Versioning Strategy
**Prompt**: "Generate an architectural ADR for [API name] versioning and evolution"
**Process**:
1. Analyze current API usage patterns and consumer dependencies
2. Design versioning strategy and backward compatibility approaches
3. Research industry best practices for API evolution
4. Generate ADR with migration recommendations and deprecation policies

### Scenario 4: Legacy API Modernization
**Prompt**: "Generate an implementation ADR for modernizing [legacy API] to Azure Web API"
**Process**:
1. Analyze legacy API architecture and integration points
2. Design modern RESTful API patterns and migration strategy
3. Create migration roadmap with risk mitigation
4. Generate ADR with detailed implementation phases and testing strategies

## Success Metrics

### Exploration Quality
- **Depth of Analysis**: Minimum 10,000 characters of documented reasoning
- **Assumption Validation**: All major assumptions about API design and usage explicitly tested
- **Pattern Recognition**: Identification of 5+ reusable API architectural patterns
- **Recommendation Actionability**: 80% of recommendations include specific implementation steps

### ADR Quality
- **Completeness**: All template sections filled with relevant API context
- **Audience Appropriateness**: ADR style matches intended audience needs
- **Evidence-Based**: All decisions supported by usage data and performance metrics
- **Implementation Readiness**: Clear acceptance criteria and API documentation

### Process Efficiency
- **Research Coverage**: Use of API testing tools, monitoring, and consumer feedback
- **Documentation Standards**: Consistent formatting and version control
- **Stakeholder Alignment**: Regular validation with API consumers and developers
- **Knowledge Transfer**: Clear documentation for team adoption of API patterns

## Continuous Improvement

### Learning from Experience
- **Post-Implementation Review**: Analyze ADR accuracy and API adoption outcomes
- **Pattern Library**: Build reusable API patterns from successful ADRs
- **Tool Enhancement**: Refine prompts and processes based on API evolution outcomes
- **Team Feedback**: Incorporate stakeholder input for API development improvement

### Scaling Best Practices
- **Template Customization**: Adapt ADR templates for different API types (internal, external, partner)
- **Automation Opportunities**: Identify repetitive tasks for API documentation generation
- **Knowledge Base**: Maintain searchable repository of ADRs and API performance benchmarks
- **Training Materials**: Develop guides for API design and development best practices

---

## Quick Reference Guide

### Key Prompts by Scenario
- **New Analysis**: "Analyze [API name] and generate [style] ADR"
- **Optimization**: "Generate implementation ADR for [performance/security] optimization"
- **Comparison**: "Compare [design A] with [design B] in ADR format"
- **Research**: "Create spike to investigate [API/scaling] uncertainty"

### ADR Style Decision Tree
- Technical audience + deep details → Technical ADR
- Business stakeholders + ROI focus → Business ADR
- System architects + design focus → Architectural ADR
- Project managers + execution focus → Implementation ADR

### Quality Checklist
- [ ] Thorough exploration (10k+ characters reasoning)
- [ ] All assumptions about API design questioned and validated
- [ ] Evidence-based conclusions with usage data
- [ ] Actionable recommendations with migration analysis
- [ ] Stakeholder-appropriate format
- [ ] Complete ADR template with API context
- [ ] Work items created in Azure DevOps</content>
<parameter name="filePath">C:\Users\david.blaszyk\source\repos\azure-analysis\standards\azure-web-api-exploration-best-practices.md