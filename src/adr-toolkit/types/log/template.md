# ADR {NNN}: {Log Analytics Workspace} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Log Analytics Workspace:** {Workspace Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Log Analytics Workspace architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the log analytics analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Log Analytics Architecture Overview

### Current State
{Describe the current Log Analytics implementation:}
- Data sources connected
- Retention policies
- Query performance
- Cost optimization

### Workspace Configuration
| Setting | Current Value | Recommended | Rationale |
|---------|---------------|-------------|-----------|
| Retention Period | {Days} | {Days} | {Reason} |
| Daily Cap | {GB} | {GB} | {Reason} |
| SKU | {PerGB/PerNode} | {SKU} | {Reason} |

## Data Sources and Ingestion

### Connected Data Sources
| Data Source | Data Type | Volume | Frequency |
|-------------|-----------|--------|-----------|
| {Source1} | {Logs/Metrics} | {GB/day} | {Frequency} |
| {Source2} | {Logs/Metrics} | {GB/day} | {Frequency} |

### Data Ingestion Patterns
- Real-time ingestion
- Batch ingestion
- Historical data migration

## Query Performance and Optimization

### Query Analysis
{Common query patterns and performance}

### Optimization Opportunities
- Query optimization
- Data aggregation
- Archive strategies

## Retention and Archival

### Data Retention Policies
- Hot data retention
- Archive storage
- Long-term retention

### Cost Optimization
- Data tiering
- Retention policy tuning
- Ingestion rate control

## Security and Compliance

### Access Control
- Workspace permissions
- Data export restrictions
- Audit logging

### Data Protection
- Encryption at rest
- Data masking
- Compliance requirements

## Integration with Azure Ecosystem

### Azure Monitor Integration
- Metrics correlation
- Alert integration
- Dashboard integration

### Azure Sentinel Integration
{Security analytics integration}

### Power BI Integration
{Reporting and visualization}

## Monitoring and Alerting

### Workspace Health Monitoring
- Ingestion health
- Query performance
- Capacity utilization

### Cost Monitoring
- Budget alerts
- Usage anomalies
- Cost optimization alerts

## Disaster Recovery

### Data Backup and Recovery
{Workspace backup strategies}

### High Availability
{Multi-region considerations}

## Context and Problem Statement

{Describe the specific problem being addressed by this Log Analytics decision.}

## Decision Drivers

{List the factors influencing this log analytics architectural decision.}

## Considered Options

{List and describe the log analytics options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected log analytics approach and rationale.}

## Positive Consequences

{List the benefits of this decision.}

## Negative Consequences

{List the drawbacks of this decision.}

## Validation

{Describe how this decision will be validated.}

## Implementation Plan

{Implementation phases and timeline}

## Risks and Mitigation

{Technical, operational, and business risks}

## Related ADRs

{List related architectural decisions}

## References

- Log Analytics documentation
- Query optimization guides
- Cost management guidelines

## Notes

{Additional considerations}