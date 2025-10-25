# ADR {NNN}: {Application Insights} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Application Insights:** {Resource Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Application Insights architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the observability analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Application Insights Architecture Overview

### Current State
{Describe the current Application Insights implementation:}
- Instrumentation coverage
- Data collection configuration
- Monitoring dashboards
- Alert configurations

### Application Inventory
| Application | Type | Environment | Instrumentation Level |
|-------------|------|-------------|----------------------|
| {App1} | {Web/API} | {Prod/Dev/Test} | {Basic/Advanced} |
| {App2} | {Web/API} | {Prod/Dev/Test} | {Basic/Advanced} |

## Instrumentation Analysis

### Telemetry Types Collected
{Analysis of telemetry data collection}

#### Request Telemetry
- HTTP request tracking
- Response time monitoring
- Success/failure rates
- Dependency calls

#### Dependency Telemetry
- External service calls
- Database operations
- Cache operations
- API integrations

#### Exception Telemetry
- Error tracking and categorization
- Stack trace analysis
- Error patterns and trends

#### Custom Telemetry
- Business metrics
- Custom events
- Performance counters
- User behavior tracking

### Instrumentation Methods
- Auto-instrumentation
- Manual instrumentation
- SDK usage
- Agent-based monitoring

## Data Collection and Retention

### Data Collection Configuration
{Sampling rates, data limits, and filtering}

### Retention Policies
- Data retention periods
- Cost optimization
- Compliance requirements

### Data Export and Integration
- Continuous export
- Log Analytics integration
- Power BI integration

## Performance Monitoring

### Key Performance Indicators
- Application response times
- Throughput metrics
- Error rates
- Availability percentages

### Performance Analysis
- Slow request identification
- Bottleneck analysis
- Performance trends
- Capacity planning

## Application Health Monitoring

### Health Checks
- Endpoint monitoring
- Synthetic transactions
- Real user monitoring

### Availability Monitoring
- Uptime tracking
- SLA monitoring
- Incident detection

## Alerting and Notification

### Alert Configuration
{Document alert rules and thresholds}

#### Metric Alerts
- Performance thresholds
- Error rate alerts
- Availability alerts

#### Log Alerts
- Custom log queries
- Pattern-based alerts
- Anomaly detection

### Action Groups
- Notification channels
- Automated responses
- Escalation procedures

## Security and Compliance

### Data Privacy
- PII data handling
- Data anonymization
- Compliance requirements

### Access Control
- RBAC configuration
- Data access restrictions
- Audit logging

## Cost Optimization

### Current Cost Analysis
{Breakdown of Application Insights costs}
- Data ingestion costs
- Data retention costs
- Advanced features costs

### Cost Optimization Opportunities
- Sampling optimization
- Retention policy tuning
- Feature usage optimization

## Integration with Monitoring Ecosystem

### Azure Monitor Integration
- Metrics correlation
- Log Analytics workspace
- Cross-resource insights

### DevOps Integration
- CI/CD pipeline integration
- Release annotations
- Performance regression detection

## Context and Problem Statement

{Describe the specific problem being addressed by this Application Insights decision.}

## Decision Drivers

{List the factors influencing this observability architectural decision.}

## Considered Options

{List and describe the monitoring options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected observability approach and rationale.}

## Positive Consequences

{List the benefits of this decision.}

## Negative Consequences

{List the drawbacks of this decision.}

## Validation

{Describe how this decision will be validated.}

## Implementation Plan

### Phase 1: Foundation
{Immediate implementation steps}

### Phase 2: Enhancement
{Monitoring improvements}

### Phase 3: Optimization
{Cost and efficiency optimizations}

## Risks and Mitigation

{Technical, operational, and business risks}

## Related ADRs

{List related architectural decisions}

## References

- Application Insights documentation
- Observability patterns
- Performance monitoring guidelines

## Notes

{Additional considerations}