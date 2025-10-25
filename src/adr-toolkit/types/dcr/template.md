# ADR {NNN}: {Data Collection Rule} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Data Collection Rule:** {Rule Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Data Collection Rule architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the data collection analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Data Collection Architecture Overview

### Current State
{Describe the current Data Collection Rule implementation:}
- Data sources configured
- Collection destinations
- Transformation rules
- Performance characteristics

### Data Collection Configuration
| Data Source | Collection Method | Destination | Frequency |
|-------------|-------------------|-------------|-----------|
| {Source1} | {Method} | {Destination} | {Frequency} |
| {Source2} | {Method} | {Destination} | {Frequency} |

## Data Sources Analysis

### Performance Counters
{System and application performance metrics}

### Event Logs
{Windows Event Log and Syslog collection}

### Application Logs
{Custom application logging}

### Platform Metrics
{Azure resource metrics}

## Data Destinations

### Log Analytics Workspace
{Workspace configuration and integration}

### Azure Monitor Metrics
{Metrics database integration}

### Event Hubs
{Real-time data streaming}

### Storage Accounts
{Archival storage}

## Data Transformation

### Filtering Rules
{Data filtering and sampling}

### Enrichment
{Data enrichment and tagging}

### Aggregation
{Metric aggregation rules}

## Performance and Scalability

### Collection Performance
- Data ingestion rates
- Latency characteristics
- Resource utilization

### Scalability Considerations
- Data volume handling
- Geographic distribution
- High availability

## Security and Compliance

### Data Access Control
- RBAC configuration
- Network restrictions
- Encryption requirements

### Compliance Requirements
- Data retention policies
- Audit logging
- Regulatory compliance

## Cost Optimization

### Current Cost Analysis
{Breakdown of data collection costs}

### Cost Optimization Opportunities
- Data filtering efficiency
- Storage optimization
- Ingestion rate optimization

## Monitoring and Alerting

### Collection Health Monitoring
- Data flow monitoring
- Error rate tracking
- Performance metrics

### Alert Configuration
- Collection failures
- Performance degradation
- Cost anomalies

## Context and Problem Statement

{Describe the specific problem being addressed by this Data Collection Rule decision.}

## Decision Drivers

{List the factors influencing this data collection architectural decision.}

## Considered Options

{List and describe the data collection options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected data collection approach and rationale.}

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

- Azure Monitor documentation
- Data collection patterns
- Performance guidelines

## Notes

{Additional considerations}