# ADR {NNN}: {Management Group} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Management Group:** {Group Name}

**Parent Management Group:** {Parent Name}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Management Group architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the governance analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Management Group Architecture Overview

### Current State
{Describe the current Management Group hierarchy:}
- Group structure and relationships
- Policy assignments
- RBAC configuration
- Resource organization

### Management Group Hierarchy
```
{Root Management Group}
├── {Child Group 1}
│   ├── {Subscription 1}
│   └── {Subscription 2}
└── {Child Group 2}
    ├── {Subscription 3}
    └── {Subscription 4}
```

## Governance Structure

### Policy Assignments
{Document policies applied at management group level}

#### Built-in Policies
- Security policies
- Compliance policies
- Cost management policies

#### Custom Policies
- Organization-specific rules
- Regulatory requirements
- Operational standards

### Policy Inheritance
- Policy precedence
- Exemption handling
- Override mechanisms

## Access Control and RBAC

### Role Assignments
{Document RBAC configuration at management group level}

#### Azure Roles
- Owner, Contributor, Reader roles
- Custom role definitions
- Role assignment scope

#### Privileged Identity Management
- JIT access configuration
- Approval workflows
- Access reviews

## Resource Organization

### Subscription Organization
- Business unit alignment
- Environment separation
- Cost center mapping

### Resource Group Strategy
- Naming conventions
- Tagging strategy
- Resource placement rules

## Compliance and Auditing

### Regulatory Compliance
- Industry standards
- Regional requirements
- Audit reporting

### Azure Policy Compliance
- Compliance monitoring
- Remediation strategies
- Compliance reporting

## Cost Management

### Cost Allocation
- Cost center mapping
- Chargeback mechanisms
- Budget controls

### Cost Optimization
- Reservation management
- Usage optimization
- Cost anomaly detection

## Operational Excellence

### Change Management
- Change tracking
- Approval processes
- Deployment standards

### Monitoring and Alerting
- Governance monitoring
- Policy violation alerts
- Compliance drift detection

## Security Posture

### Security Policies
- Security baseline policies
- Threat protection
- Access control policies

### Security Monitoring
- Security alerts
- Threat intelligence
- Incident response

## Context and Problem Statement

{Describe the specific problem being addressed by this Management Group decision.}

## Decision Drivers

{List the factors influencing this governance architectural decision.}

## Considered Options

{List and describe the governance options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected governance approach and rationale.}

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

- Azure Management Groups documentation
- Governance best practices
- Policy as Code guidelines

## Notes

{Additional considerations}