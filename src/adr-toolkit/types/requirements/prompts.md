# Requirements Analysis Prompts

## Description Section
**Goal**: Explain the requirement in plain English that business stakeholders can understand.

**Prompts**:
- What is the current state of the system/feature?
- What problem are we trying to solve or what opportunity are we pursuing?
- Who will benefit from this change and how?
- What is the expected business impact?

**Tips**: Keep it to 2 paragraphs. Avoid technical jargon. Focus on business value.

## User Story Section
**Goal**: Define the primary user need in the standard "As a... I want... So that..." format.

**Prompts**:
- Who is the primary user/role that will use this feature?
- What specific capability do they need?
- What business value or benefit will they achieve?

**Tips**: Focus on one primary user story. Keep it concise and outcome-focused.

## Scenarios Section
**Goal**: Describe the main use cases and edge cases using Given-When-Then format.

**Prompts**:
- What is the happy path scenario?
- What alternative paths exist?
- What error conditions should be handled?
- What edge cases need consideration?

**Tips**: Start with the primary success scenario, then add alternatives and error cases.

## Acceptance Criteria Section

### Scenario-Based Format (Recommended)
**Goal**: Define acceptance criteria as detailed scenarios using Given-When-Then format that can be directly tested.

**Prompts**:
- What is the primary success scenario?
- What alternative scenarios exist?
- What error or edge cases must be handled?
- What are the measurable outcomes for each scenario?

**Tips**: Use Given/When/Then format. Each scenario should be independently testable. Cover happy path, alternatives, and exceptions.

### Functional Requirements
**Goal**: Define measurable requirements that prove the feature works correctly.

**Prompts**:
- What must the system do? (not how)
- How will we measure success?
- What data validation is required?
- What business rules must be enforced?

**Tips**: Make criteria measurable and testable. Focus on "what" not "how".

### Non-Functional Requirements
**Goal**: Define quality attributes like performance, security, and reliability.

**Prompts**:
- What performance standards must be met?
- What security/compliance requirements apply?
- What availability/reliability standards are needed?
- What scalability requirements exist?

**Tips**: Be specific with numbers where possible (e.g., "response time < 2 seconds").

## Technical Detail Section
**Goal**: Provide implementation guidance while maintaining separation from business requirements.

**Prompts**:
- What is the high-level implementation approach?
- What systems/components are involved?
- What are the key technical considerations?
- What dependencies and risks exist?

**Tips**: Keep this section focused on HOW while the earlier sections focus on WHAT.

## Azure-Specific Guidance

### Azure Data Factory Requirements
**User Story Focus**:
- Data engineers, analysts, system administrators
- Data integration, ETL processes, data pipeline automation
- Business intelligence, reporting, operational efficiency

**Functional Requirements Prompts**:
- What data sources and destinations are involved?
- What data transformations or business rules must be applied?
- How should data quality issues be handled?
- What are the data volume and frequency requirements?

**Non-Functional Requirements Prompts**:
- What pipeline execution time limits apply?
- What data accuracy and completeness standards are required?
- How should the solution scale with data growth?
- What monitoring and alerting is needed?

**Scenarios to Consider**:
- Successful data pipeline execution
- Data quality validation failures
- Source system unavailability
- Target system capacity issues

### Azure Functions Requirements
**User Story Focus**:
- Application developers, system integrators, API consumers
- Event-driven processing, API endpoints, automated workflows
- Real-time responses, system integration, microservices

**Functional Requirements Prompts**:
- What triggers or events should initiate processing?
- What inputs and outputs are expected?
- How should errors and exceptions be handled?
- What integration points with other systems exist?

**Non-Functional Requirements Prompts**:
- What response time and throughput requirements apply?
- How should the function scale under load?
- What cold start performance is acceptable?
- What reliability and error rates are required?

**Scenarios to Consider**:
- Successful event processing and response
- Invalid input data handling
- External service failures
- High concurrency situations

## General Guidance

### When to Use Requirements Analysis
- New feature development
- System enhancements
- Integration requirements
- Process improvements
- API/service requirements

### Best Practices
- **Collaborate**: Involve business and technical stakeholders
- **Iterate**: Start simple and refine based on feedback
- **Validate**: Ensure acceptance criteria are measurable
- **Prioritize**: Focus on high-value requirements first
- **Document**: Keep related documents and references current

### Common Pitfalls to Avoid
- Mixing WHAT with HOW in acceptance criteria
- Making requirements too technical for business stakeholders
- Creating unmeasurable acceptance criteria
- Forgetting edge cases and error scenarios
- Not considering non-functional requirements

### Validation Checklist
- [ ] Description is clear to business stakeholders
- [ ] User Story follows standard format
- [ ] Scenarios cover main paths and edge cases
- [ ] Acceptance criteria are measurable
- [ ] Technical details are separated from requirements
- [ ] Dependencies and risks are identified

## Business Context Section
**Goal**: Provide strategic context and business justification for the requirement.

**Prompts**:
- What business problem does this solve?
- How does this align with organizational goals?
- What are the expected business outcomes?
- Who are the key stakeholders and their interests?
- What is the competitive or market advantage?

**Tips**: Focus on business value, strategic alignment, and stakeholder impact. Keep it concise but comprehensive.

## User Stories with Story Points Section
**Goal**: Break down the requirement into implementable user stories with effort estimates.

**Prompts**:
- What are the key user interactions or features needed?
- How can this be broken into smaller, independent pieces?
- What is the relative complexity of each story?
- What are the dependencies between stories?
- How should stories be prioritized?

**Tips**: Use the story point guidelines (1, 2, 5). Include acceptance criteria and technical details for each story. Ensure stories are independent and testable.

### Story Point Guidelines Reminder:
- **SP 1 (2-6 hours)**: Simple tasks, clear requirements, minimal complexity
- **SP 2 (4-10 hours)**: Moderate complexity, some analysis needed, integration work
- **SP 5 (12-25 hours)**: Complex tasks, significant analysis/design, multiple dependencies

**Story Pointing Prompts**:
- Does this require new technology or complex algorithms?
- How many systems/components are involved?
- What testing effort is required (unit, integration, performance)?
- Are there significant unknowns or research needed?
- What is the impact on existing architecture?