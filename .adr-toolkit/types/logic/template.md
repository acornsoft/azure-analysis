# ADR {NNN}: {Logic App Name} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Logic App:** {Logic App Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Logic App architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the deep dive analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Logic App Architecture Overview

### Current State
{Describe the current Logic App implementation, including:}
- Logic App type (Consumption, Standard, ISE)
- Number of workflows and their purposes
- Integration patterns and connectors used
- Runtime and hosting environment

### Architecture Diagram
{Include high-level architecture diagram showing:}
- Workflow triggers and actions
- Data flow patterns
- External service integrations
- Error handling and retry logic

### Workflow Inventory
| Workflow Name | Trigger Type | Purpose | Connectors Used | Estimated Load |
|---------------|--------------|---------|-----------------|----------------|
| {Workflow1} | {HTTP/Recurrence/API} | {Purpose} | {SQL, Office365, etc.} | {Low/Medium/High} |
| {Workflow2} | {HTTP/Recurrence/API} | {Purpose} | {SQL, Office365, etc.} | {Low/Medium/High} |

## Trigger and Action Analysis

### Trigger Patterns
{Analyze each trigger type used:}

#### HTTP Triggers
- Authentication mechanisms
- Request/response patterns
- API versioning strategy
- Rate limiting considerations

#### Recurrence Triggers
- Schedule frequency and business justification
- Time zone considerations
- Overlap handling strategy

#### Event-Based Triggers
- Event Grid subscriptions
- Service Bus triggers
- Storage account triggers
- Custom webhook triggers

#### API Connection Triggers
- Office 365 connectors
- Dynamics 365 integration
- Salesforce integration
- Custom API connections

### Action Patterns
{Analyze action configurations:}

#### Data Operations
- Compose and parse JSON
- Transform data structures
- Variable management
- Array operations

#### Control Flow Actions
- Conditionals and switches
- Loops and iterations
- Scopes and error handling
- Parallel execution

#### Integration Actions
- HTTP requests and responses
- Database operations
- File system operations
- Email and messaging

### Connector Usage Analysis
{Document connector dependencies and usage patterns}

## Hosting Model and Runtime

### Logic App Type Analysis
{Consumption vs. Standard vs. ISE evaluation}

#### Consumption Plan
- Cost analysis
- Scaling limitations
- Geographic availability
- Connector availability

#### Standard Plan
- Performance benefits
- Cost implications
- VNET integration
- Custom connector support

#### Integration Service Environment (ISE)
- Enterprise requirements
- Network isolation
- Custom connector hosting
- Compliance benefits

### Runtime Configuration
{Application settings, connection strings, and configuration management}

## Performance and Scalability

### Current Performance Metrics
{Document current performance characteristics:}
- Workflow execution times
- Success/failure rates
- Throughput limitations
- Resource utilization

### Scaling Considerations
- Concurrent instance limits
- Action throttling
- Retry policy configuration
- Performance optimization

### Bottleneck Analysis
{Identify performance bottlenecks and optimization opportunities}

## Security and Authentication

### Authentication Mechanisms
{Analysis of authentication patterns:}

#### Managed Identity
- System-assigned vs. user-assigned
- Key Vault integration
- Cross-resource access

#### API Connections
- Connection security
- Credential management
- Token refresh strategies

#### Custom Authentication
- OAuth implementations
- API key management
- Certificate-based auth

### Data Protection
- In-transit encryption
- At-rest encryption
- Secure data handling
- Compliance requirements

### Network Security
- VNET integration
- Private endpoints
- Firewall configuration
- Access restrictions

## Monitoring and Observability

### Current Monitoring Setup
{Application Insights and Azure Monitor configuration}

### Key Metrics to Monitor
- Workflow execution metrics
- Connector performance
- Error rates and types
- Resource consumption

### Logging Strategy
- Run history retention
- Diagnostic logging
- Custom telemetry
- Cost optimization

### Alerting Configuration
{Critical alerts and notification channels}

## Cost Optimization

### Current Cost Analysis
{Breakdown of Logic App costs:}
- Execution costs
- Connector costs
- Data transfer costs
- Premium connector fees

### Cost Optimization Opportunities
- Right-sizing hosting plans
- Optimizing workflow design
- Reducing unnecessary actions
- Connector usage optimization

## Integration Patterns and Best Practices

### Workflow Design Patterns
- Sequential processing
- Parallel execution
- Error handling patterns
- State management

### Enterprise Integration Patterns
- Message routing
- Content-based routing
- Scatter-gather
- Request-reply patterns

### API Management Integration
- API versioning
- Request throttling
- Response caching
- Security policies

## Context and Problem Statement

{Describe the specific problem or architectural challenge being addressed by this Logic App decision.}

## Decision Drivers

{List the factors that influence this Logic App architectural decision:}
- Integration complexity
- Performance requirements
- Cost constraints
- Security requirements
- Operational complexity
- Development velocity

## Considered Options

{List and describe the Logic App architectural options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected Logic App architecture approach and rationale.}

### Implementation Approach
{Detailed implementation strategy for the chosen option.}

## Positive Consequences

{List the benefits and positive outcomes of this decision.}

## Negative Consequences

{List the drawbacks and trade-offs of this decision.}

## Validation

{Describe how this Logic App decision will be validated and measured for success.}

## Implementation Plan

### Phase 1: Foundation
{Immediate implementation steps}

### Phase 2: Enhancement
{Performance and reliability improvements}

### Phase 3: Optimization
{Cost and operational optimizations}

### Phase 4: Evolution
{Future scalability and feature enhancements}

## Risks and Mitigation

### Technical Risks
{Workflow failures, connector issues, scaling limitations}

### Operational Risks
{Monitoring gaps, deployment failures, cost overruns}

### Business Risks
{Integration failures, data inconsistencies, compliance violations}

## Migration and Modernization

### Legacy System Integration
{Strategies for migrating from legacy integration platforms}

### Technology Stack Evolution
{Planning for connector updates and technology changes}

### Cloud-Native Patterns
{Adoption of cloud-native integration patterns}

## Compliance and Regulatory Considerations

{GDPR, HIPAA, SOX, or other compliance requirements affecting data integration}

## Testing Strategy

### Unit Testing
{Workflow component testing}

### Integration Testing
{End-to-end integration validation}

### Performance Testing
{Load testing and performance validation}

### Chaos Engineering
{Fault injection and resilience testing}

## Disaster Recovery and Business Continuity

### Backup and Recovery
{Workflow backup strategies and recovery procedures}

### High Availability
{Multi-region deployment and failover strategies}

### Business Continuity Planning
{Disaster recovery procedures and communication plans}

## Related ADRs

{List related architectural decisions that impact or are impacted by this Logic App decision.}

## References

- Azure Logic Apps documentation
- Azure Well-Architected Framework
- Integration patterns
- Security guidelines
- Cost optimization guides

## Notes

{Additional considerations, assumptions, and future work items.}