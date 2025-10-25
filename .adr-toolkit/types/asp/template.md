# ADR {NNN}: {App Service Plan} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**App Service Plan:** {Plan Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Location:** {Azure Region}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the App Service Plan architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the hosting plan analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## App Service Plan Architecture Overview

### Current State
{Describe the current App Service Plan implementation:}
- Plan tier and size
- Associated web apps
- Scaling configuration
- Resource utilization

### Plan Configuration
| Setting | Current Value | Recommended | Rationale |
|---------|---------------|-------------|-----------|
| Tier | {Free/Shared/Basic/Standard/Premium} | {Tier} | {Reason} |
| Size | {Small/Medium/Large} | {Size} | {Reason} |
| Instance Count | {Count} | {Count} | {Reason} |
| Zone Redundant | {Enabled/Disabled} | {Setting} | {Reason} |

## Associated Applications

### Web App Inventory
| Web App | Purpose | Traffic Pattern | Resource Usage |
|---------|---------|-----------------|----------------|
| {App1} | {Purpose} | {Pattern} | {CPU/Memory} |
| {App2} | {Purpose} | {Pattern} | {CPU/Memory} |

## Performance and Scaling

### Current Performance Metrics
- CPU utilization
- Memory utilization
- Response times
- Error rates

### Scaling Configuration
{Auto-scaling rules and manual scaling}

#### Scale-Out Rules
- CPU threshold
- Memory threshold
- Queue length
- Custom metrics

#### Scale-In Rules
- Cool-down periods
- Minimum instances
- Cost optimization

## Cost Analysis

### Current Cost Breakdown
- Base plan costs
- Per-instance costs
- Data transfer costs
- Premium feature costs

### Cost Optimization Opportunities
- Right-sizing recommendations
- Reserved instance usage
- Usage pattern analysis
- Alternative hosting options

## High Availability and Reliability

### Deployment Slots
- Staging slot usage
- Swap operations
- Rollback capabilities

### Backup and Recovery
- Application backups
- Configuration backups
- Disaster recovery

## Security Considerations

### Network Security
- VNET integration
- Private endpoints
- IP restrictions

### Access Control
- RBAC configuration
- Application permissions
- Monitoring access

## Monitoring and Alerting

### Plan Health Monitoring
- Resource utilization alerts
- Performance degradation
- Capacity planning

### Application Monitoring
- Per-app metrics
- Cross-app dependencies
- Performance correlation

## Migration and Modernization

### Legacy Application Migration
{Strategies for migrating from legacy platforms}

### Technology Stack Evolution
{Planning for runtime updates and technology changes}

## Context and Problem Statement

{Describe the specific problem being addressed by this App Service Plan decision.}

## Decision Drivers

{List the factors influencing this hosting plan architectural decision.}

## Considered Options

{List and describe the hosting options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected hosting plan approach and rationale.}

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

- Azure App Service documentation
- Hosting plan best practices
- Cost optimization guides

## Notes

{Additional considerations}