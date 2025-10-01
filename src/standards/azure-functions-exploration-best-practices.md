# Azure Functions Exploration & ADR Generation Best Practices

## Overview

These instructions combine the Sherpa Agent approach (thorough, self-questioning reasoning) with structured ADR generation processes and workspace-agnostic Azure Functions analysis frameworks. They provide best practices for exploring Azure Functions applications and generating Architecture Decision Records (ADRs) that drive informed serverless architecture decisions.

## Ecolab.CRM.Azure.CDM Case Study Insights

Based on comprehensive analysis of Ecolab's Customer Data Management Azure Functions project, here are proven patterns and lessons learned:

### Critical Architectural Patterns

1. **Digital Enablement vs Change Feed Separation**
   - **Pattern**: Maintain separate Azure Functions for outbound (queue-based) and inbound (topic-based) processing
   - **Rationale**: Different scaling requirements, error handling strategies, and business logic complexity
   - **Ecolab Example**: `CDMIntegrationFunction.cs` (queue) vs `ReadSubscriptionMessage.cs` (topic)

2. **Service Bus Connection Isolation**
   - **Pattern**: Use separate connection strings for queue and topic processing
   - **Rationale**: Prevents cross-contamination and enables independent scaling/monitoring
   - **Ecolab Example**: `ServiceBusConnectionForQueue` vs `ServiceBusConnectionForTopic`

3. **CRM Transaction Management**
   - **Pattern**: Use `TransactionScope` for multi-entity operations with proper rollback
   - **Rationale**: Ensures data consistency and prevents partial updates
   - **Ecolab Example**: User creation with role assignment in `CDMUserCustomerRoleProcess`

4. **Comprehensive Error Handling**
   - **Pattern**: Implement dead letter queues, structured logging, and Application Insights monitoring
   - **Rationale**: Prevents message loss and provides operational visibility
   - **Ecolab Example**: Automatic dead letter routing with detailed error context

### Key Lessons from Ecolab Analysis

- **FetchXML Optimization**: Use FetchXML over QueryExpression for complex queries with joins
- **Duplicate Prevention**: Always check entity existence before creation operations
- **Relationship Management**: Handle complex entity relationships (user-account-site) with care
- **External API Integration**: Implement proper HTTP client management with timeout/retry logic
- **Configuration Management**: Use environment variables for service connections and credentials

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

### Phase 1: Function App Context Analysis
**Objective**: Understand the Azure Functions workspace and identify architectural decisions needing ADRs.

**Steps**:
1. **Workspace Scanning**: Automatically inventory all function apps, functions, triggers, and bindings
2. **Pattern Recognition**: Identify serverless patterns, trigger types, and integration approaches
3. **Gap Analysis**: Compare current state against serverless best practices and requirements
4. **Decision Identification**: List 3-5 architectural decisions needing ADRs

**Sherpa Reasoning**: "What serverless patterns do I see here? Are these event-driven or scheduled functions? What assumptions am I making about the scaling requirements?"

**Tools to Use**:
- `list_dir` on function app directories and function folders
- `read_file` on function.json, host.json, and code files for pattern analysis
- `grep_search` for specific binding configurations and trigger types

### Phase 2: ADR Generation
**Objective**: Create focused ADRs using appropriate styles based on audience and purpose.

**ADR Style Selection**:
- **Technical ADR**: For developers/architects - deep implementation details and code patterns
- **Business ADR**: For executives/stakeholders - business value and cost optimization
- **Architectural ADR**: For enterprise architects - system design and scalability patterns
- **Implementation ADR**: For project managers - deployment and operational runbooks

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
[Function code examples, binding configurations, deployment steps]

**Consequences**
[Benefits, drawbacks, mitigations - including cold start impacts]

**Acceptance Criteria**
[8-10 measurable outcomes including performance benchmarks]

**Additional Notes**
[Next steps, monitoring setup, cost optimization recommendations]
```

**Sherpa Reasoning**: "Is this the right ADR style for this serverless architecture? What assumptions am I making about scaling needs? Should I include more cost analysis or focus on performance characteristics?"

### Phase 3: Technical Spike Creation
**Objective**: Address uncertainties through focused research and prototyping.

**When to Create Spikes**:
- Unknown cold start performance impacts
- Unclear scaling behavior under load
- Uncertain cost optimization strategies
- New runtime or binding evaluation

**Spike Format**:
```
User Story: As [team/role], I need to [research task], so that [resolve uncertainty]

Acceptance Criteria:
- [4-6 measurable outcomes including performance metrics]
- Timebox: [4-8 hours]

Implementation Notes:
- [Research approach, load testing, monitoring setup]
```

**Sherpa Reasoning**: "What exactly is uncertain about this serverless implementation? How can I design a spike that will definitively answer scaling and performance questions?"

### Phase 4: Azure DevOps Integration
**Objective**: Track ADRs and spikes as work items for project management.

**Work Item Hierarchy**:
- **Epic**: Function app area (e.g., "Serverless API Modernization")
- **Feature**: ADR topic (e.g., "Function Scaling Optimization")
- **User Story**: ADR implementation or spike
- **Task**: Specific implementation steps

**Required Fields**:
- Title: ADR/Spike title
- Description: Full ADR text or spike details
- Acceptance Criteria: From ADR/spike
- Tags: "ADR", "Spike", "AzureFunctions", "Serverless"
- Links: Connect spikes to parent ADRs

**Sherpa Reasoning**: "How will this work item fit into the serverless development lifecycle? What dependencies exist with other function apps?"

## Specific Prompts for Azure Functions Exploration

### Function App Analysis Prompts
```
"Analyze the current state of [function app] and identify serverless architectural patterns. Compare with Ecolab's Digital Enablement vs Change Feed separation pattern."
"Compare [function A] with [function B] for consistency and performance optimization. Consider Service Bus connection isolation like in Ecolab's implementation."
"Identify trigger patterns and binding configurations across this function app. Are queue and topic processing properly separated?"
"Assess cold start impacts and scaling behavior in this serverless architecture. How does it compare to Ecolab's transaction-heavy CRM operations?"
```

### ADR Generation Prompts
```
"Generate a technical ADR for [function app] focusing on performance and scaling, incorporating Ecolab's Service Bus patterns"
"Generate a business ADR for [function app] emphasizing cost optimization and ROI, considering CRM integration complexity"
"Generate an architectural ADR for [function app] analyzing event-driven patterns like Ecolab's Digital Enablement vs Change Feed"
"Generate an implementation ADR for [function app] with deployment and monitoring setup, including dead letter queue management"
```

### Ecolab-Specific Analysis Prompts
```
"Analyze Service Bus trigger patterns in this project. Should queue and topic processing use separate connections like Ecolab?"
"Evaluate CRM integration patterns. Are FetchXML queries optimized and transaction management properly implemented?"
"Assess error handling and monitoring. Is structured logging and dead letter queue routing implemented like Ecolab?"
"Review function separation strategy. Should Digital Enablement and Change Feed processing be in separate functions?"
```

### Customization Prompts
```
"Include cold start analysis in the ADR for [function app], considering Ecolab's CRM transaction patterns"
"Focus on durable functions patterns in the ADR, comparing with Ecolab's Service Bus integration"
"Compare consumption plan vs dedicated plan for [workload], factoring in Ecolab's complex business logic"
"Add cost monitoring and optimization recommendations to the ADR, including CRM operation costs"
```

### Technical Spike Prompts
```
"Create a spike to evaluate cold start performance for [function type]"
"Research scaling limits of [consumption plan] under [load conditions]"
"Prototype [durable function pattern] and compare with existing implementation"
"Investigate integration challenges between [function app] and [external service]"
```

### Azure DevOps Prompts
```
"Create work items for this ADR and related function optimization spikes"
"Map this ADR to the serverless development backlog and sprint planning"
"Link this spike to dependent functions and integration testing"
"Generate acceptance criteria for function performance optimization tasks"
```

## Best Practices for Effective Exploration

### 1. Documentation Standards
- **Markdown First**: All analysis in Analysis/ folder with sequence diagrams
- **Version Control**: Clear commit messages linking to function deployments
- **Stakeholder Formats**: Export to DOCX/PDF for different audiences
- **C4 Diagrams**: Use system context, container, component, and code views for serverless

### 2. Quality Assurance
- **Code Review Checklist**: Validate against Azure Functions best practices
- **Pattern Recognition**: Identify common serverless, event-driven, and integration patterns
- **Performance Benchmarks**: Establish measurable metrics for cold starts and scaling
- **Security Assessment**: Evaluate authentication, authorization, and data protection

### 3. Research Methodology
- **First Principles**: Break down serverless problems to fundamental scaling and cost components
- **Evidence-Based**: Support all conclusions with performance data and monitoring
- **Iterative Refinement**: Revise conclusions as new scaling evidence emerges
- **Cross-Validation**: Compare findings across multiple function apps and triggers

### 4. Communication Strategies
- **Audience Adaptation**: Tailor ADR style and depth to recipient needs (devs vs business)
- **Visual Aids**: Use sequence diagrams for complex function orchestration
- **Executive Summaries**: Provide high-level overviews with drill-down performance details
- **Actionable Recommendations**: Include specific, measurable next steps with cost impacts

### 5. Tool Integration
- **Azure DevOps**: Use for work item tracking and release management
- **Git Integration**: Maintain ADR history alongside function code
- **Testing Frameworks**: Validate ADR recommendations through automated tests
- **Monitoring Tools**: Establish baselines for performance, costs, and reliability

## Common Azure Functions Exploration Scenarios

### Scenario 1: New Function App Analysis
**Prompt**: "Analyze this new Azure Functions app and generate a technical ADR"
**Process**:
1. Inventory all functions, triggers, and bindings
2. Assess architectural patterns and best practices compliance
3. Compare with Ecolab's Digital Enablement vs Change Feed separation
4. Identify optimization opportunities and scaling risks
5. Generate ADR with implementation recommendations

### Scenario 2: CRM Integration Analysis (Ecolab Pattern)
**Prompt**: "Analyze CRM integration patterns in this Azure Functions app and generate an ADR"
**Process**:
1. Examine Dynamics 365 integration using Microsoft.Xrm.Sdk patterns
2. Assess FetchXML query optimization and transaction management
3. Evaluate duplicate prevention and relationship handling
4. Compare with Ecolab's user-account-site relationship management
5. Generate ADR with CRM integration best practices

### Scenario 3: Service Bus Architecture Review (Ecolab Pattern)
**Prompt**: "Review Service Bus integration patterns and generate an architectural ADR"
**Process**:
1. Analyze queue vs topic processing separation
2. Assess connection string isolation and security
3. Evaluate error handling and dead letter queue management
4. Compare with Ecolab's separate connections for Digital Enablement and Change Feed
5. Generate ADR with Service Bus architecture recommendations

### Scenario 4: Performance Optimization
**Prompt**: "Generate an implementation ADR for optimizing [function app] cold start performance"
**Process**:
1. Analyze current cold start metrics and scaling bottlenecks
2. Research optimization techniques (pre-warming, premium plans, etc.)
3. Consider Ecolab's transaction-heavy CRM operations impact
4. Create spike for testing optimization approaches
5. Generate ADR with phased implementation plan

### Scenario 5: Cost Optimization
**Prompt**: "Generate a business ADR comparing consumption vs dedicated plans for [function app]"
**Process**:
1. Analyze current usage patterns and cost drivers
2. Model different hosting plan scenarios
3. Consider CRM integration and complex business logic costs
4. Research cost optimization best practices
5. Generate ADR with cost-benefit analysis and migration recommendations

### Scenario 6: Event-Driven Architecture Migration
**Prompt**: "Generate an architectural ADR for migrating [monolithic app] to event-driven functions"
**Process**:
1. Analyze current monolithic architecture and coupling points
2. Design event-driven function patterns and integration points
3. Reference Ecolab's Service Bus queue and topic patterns
4. Create migration roadmap with risk mitigation
5. Generate ADR with detailed implementation phases and testing strategies

## Success Metrics

### Exploration Quality
- **Depth of Analysis**: Minimum 10,000 characters of documented reasoning
- **Assumption Validation**: All major assumptions about scaling and costs explicitly tested
- **Pattern Recognition**: Identification of 5+ reusable serverless architectural patterns
- **Recommendation Actionability**: 80% of recommendations include specific implementation steps

### ADR Quality
- **Completeness**: All template sections filled with relevant serverless context
- **Audience Appropriateness**: ADR style matches intended audience needs
- **Evidence-Based**: All decisions supported by performance data and cost analysis
- **Implementation Readiness**: Clear acceptance criteria and operational runbooks

### Process Efficiency
- **Research Coverage**: Use of Azure portal, monitoring tools, and performance testing
- **Documentation Standards**: Consistent formatting and version control
- **Stakeholder Alignment**: Regular validation with development and business stakeholders
- **Knowledge Transfer**: Clear documentation for team adoption of serverless patterns

## Continuous Improvement

### Learning from Experience
- **Post-Implementation Review**: Analyze ADR accuracy and function performance outcomes
- **Pattern Library**: Build reusable serverless patterns from successful ADRs
- **Tool Enhancement**: Refine prompts and processes based on scaling outcomes
- **Team Feedback**: Incorporate stakeholder input for serverless development improvement

### Scaling Best Practices
- **Template Customization**: Adapt ADR templates for different function types (HTTP, timer, queue)
- **Automation Opportunities**: Identify repetitive tasks for Infrastructure as Code
- **Knowledge Base**: Maintain searchable repository of ADRs and performance benchmarks
- **Training Materials**: Develop guides for serverless development and optimization

---

## Quick Reference Guide

### Key Prompts by Scenario
- **New Analysis**: "Analyze [function app] and generate [style] ADR"
- **Optimization**: "Generate implementation ADR for [performance/cost] optimization"
- **Comparison**: "Compare [plan A] with [plan B] in ADR format"
- **Research**: "Create spike to investigate [scaling/cost] uncertainty"

### ADR Style Decision Tree
- Technical audience + deep details → Technical ADR
- Business stakeholders + ROI focus → Business ADR
- System architects + design focus → Architectural ADR
- Project managers + execution focus → Implementation ADR

### Quality Checklist
- [ ] Thorough exploration (10k+ characters reasoning)
- [ ] All assumptions about scaling/costs questioned and validated
- [ ] Evidence-based conclusions with performance data
- [ ] Actionable recommendations with cost analysis
- - [ ] Stakeholder-appropriate format
- [ ] Complete ADR template with serverless context
- [ ] Work items created in Azure DevOps</content>
<parameter name="filePath">C:\Users\david.blaszyk\source\repos\azure-analysis\standards\azure-functions-exploration-best-practices.md