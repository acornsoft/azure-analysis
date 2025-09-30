# General Instructions for Generating Focused ADRs for Client Projects

## Purpose
These instructions guide an AI assistant (e.g., Grok, GPT-5, or any LLM) to generate focused Architecture Decision Records (ADRs) for client projects, driving development research for the Design phase. ADRs address specific architectural decisions (e.g., authentication, testing tools, data schemas) and are supported by Technical Spikes (User Stories) for uncertainties and Azure DevOps Work Items for tracking. The process is AI-agnostic, usable in VS Code with extensions like Continue.dev or CodeGPT, and leverages tools (e.g., web_search, code_execution) for research. This guide is based on prior work for CDM changefeed testing with Azure Service Bus.

## Instructions
Follow these steps to generate focused ADRs for client projects, ensuring concise, research-driven decisions aligned with client needs (e.g., data integration, cloud architecture).

### 1. Identify Client Project Needs
- **Action**: Analyze client requirements (e.g., integration, testing, scaling) to identify architectural decisions needing ADRs. Examples: "Choose authentication for Service Bus," "Select testing tool for API integration," "Define data schemas for CRM sync."
- **AI Guidance**: If requirements are unclear, use web_search (query: "common architectural decisions in [project domain] 2025") or analyze project files (e.g., `.md`, `.json` specs). Query: "What are key decisions for [project domain]?"
- **Output**: List 3-5 decision areas in a markdown list.

### 2. Generate Focused ADR
For each decision, create an ADR using this template (500-1000 words). Use tools for research.

- **Title**: Descriptive, e.g., "Selecting Postman for API Testing in Cloud Integration."
- **Status**: Proposed, Accepted, or Deprecated.
- **Context**: Describe problem, constraints, options (100-200 words). Example: "Client needs reliable API testing for Service Bus integration. Options: Postman, Azure SDK, curl."
  - **AI Guidance**: Use web_search (e.g., "API testing tools 2025") or browse_page (e.g., Microsoft docs) for options.
- **User Story Description**: Format: "As [role], we need [goal], such that [benefit]." Example: "As Integration Specialist, we need a stable testing environment, such that engineers can validate integrations across Dev/QA/Prod."
- **Decision**: State choice, rationale, alternatives (100 words). Example: "Use Postman for UI and scripting, over Azure SDK (complex) or curl (manual)."
- **Implementation Details**: Provide steps (e.g., environment setup, scripts, tests). Include 2-3 example tests for key components (e.g., message formats, API calls).
  - **AI Guidance**: Use code_execution for prototypes (e.g., JavaScript for scripts). Infer schemas or search (e.g., "CRM message formats").
- **Consequences**: List benefits (e.g., rapid testing), drawbacks (e.g., scripting limits), mitigations (e.g., training).
- **Acceptance Criteria**: 8-10 measurable outcomes, including tests for specific formats if applicable (e.g., "Tests pass for 2-3 messages of defined schema").
  - **AI Guidance**: Ensure criteria are testable (e.g., API status codes, schema validation).
- **Additional Notes**: Next steps (e.g., "Explore alternative auth"), CI commands (e.g., `newman run...`).

**AI Guidance**: Reason using stream-of-consciousness, explore options, question assumptions (e.g., "Is tool scalable?"). Output GFM markdown with proper code block fencing (```javascript).

### 3. Create Technical Spikes for Uncertainties
If the ADR has unknowns (e.g., "Postman scalability"), create a Technical Spike as a User Story.

- **User Story Format**: "As [team/role], I need to [research task], so that [resolve uncertainty]." Example: "As Development Team, I need to evaluate Postman’s performance, so that we confirm it meets scalability needs."
- **Acceptance Criteria**: 4-6 items, e.g., "Document findings," "Prototype solution."
- **Timebox**: 4-8 hours.
- **AI Guidance**: Use web_search (e.g., "Postman scalability 2025"), x_keyword_search (e.g., X posts), or code_execution for prototypes. Output as markdown addendum.

### 4. Map to Azure DevOps Work Items
Convert ADRs and Spikes to Work Items.

- **Hierarchy**:
  - Epic: Project area (e.g., "Cloud Integration").
  - Feature: ADR topic (e.g., "Testing Framework").
  - User Story: Spike or ADR implementation (e.g., "Spike: Postman Performance").
  - Task: Steps (e.g., "Write test script").
- **Fields**:
  - Title: From ADR/Spike.
  - Description: ADR text or summary, link to markdown (e.g., GitHub).
  - Acceptance Criteria: From ADR/Spike.
  - Area/Iteration: Client project path.
  - Tags: "ADR," "Spike," "Research."
  - Links: Link Spike to ADR.
- **AI Guidance**: Output JSON for DevOps API or describe fields. Example:
  ```json
  {
    "op": "add",
    "path": "/fields/System.Title",
    "value": "ADR: Postman for Testing"
  }