# ADR {NNN}: {Resource Group} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Resource Group:** {Group Name}

**Azure Subscription:** {Subscription ID}

**Location:** {Azure Region}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Resource Group architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the resource organization analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Resource Group Architecture Overview

### Current State
{Describe the current Resource Group implementation:}
- Resource inventory
- Organization patterns
- Tagging strategy
- Access controls

### Resource Inventory
| Resource Type | Count | Purpose | Criticality |
|---------------|-------|---------|-------------|
| {VMs} | {Count} | {Purpose} | {Level} |
| {Storage} | {Count} | {Purpose} | {Level} |
| {Networks} | {Count} | {Purpose} | {Level} |

## Resource Organization Strategy

### Naming Conventions
{Document resource naming patterns}

### Tagging Strategy
{Resource tagging implementation}

#### Required Tags
- Environment, Owner, Cost Center
- Compliance and security tags
- Operational tags

#### Tag Governance
- Tag enforcement policies
- Tag consistency validation
- Tag reporting

## Access Control and Security

### RBAC Configuration
{Resource group level permissions}

#### Role Assignments
- Contributor and Reader roles
- Custom role definitions
- Service principal access

#### Resource Locks
- Delete locks
- Read-only locks
- Lock management

## Resource Lifecycle Management

### Deployment Patterns
- ARM template usage
- Bicep adoption
- Infrastructure as Code

### Resource Dependencies
- Resource relationships
- Deployment ordering
- Failure handling

## Cost Management

### Cost Allocation
- Resource group cost tracking
- Budget assignments
- Cost center mapping

### Cost Optimization
- Unused resource cleanup
- Right-sizing recommendations
- Reservation utilization

## Monitoring and Compliance

### Resource Health Monitoring
- Resource status tracking
- Health alerts
- Performance monitoring

### Compliance Monitoring
- Policy compliance
- Configuration drift
- Audit logging

## Disaster Recovery

### Backup Configuration
- Resource backup strategies
- Recovery point objectives
- Restore procedures

### High Availability
- Cross-region replication
- Failover configurations
- Business continuity

## Operational Excellence

### Change Management
- Resource modification tracking
- Approval workflows
- Change validation

### Automation
- Automated deployments
- Configuration management
- Remediation scripts

## Context and Problem Statement

{Describe the specific problem being addressed by this Resource Group decision.}

## Decision Drivers

{List the factors influencing this resource organization architectural decision.}

## Considered Options

{List and describe the resource organization options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected resource organization approach and rationale.}

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

- Azure Resource Groups documentation
- Resource organization best practices
- Governance guidelines

## Notes

{Additional considerations}