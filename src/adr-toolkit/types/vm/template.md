# ADR {NNN}: {Virtual Machine} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Virtual Machine:** {VM Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Location:** {Azure Region}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Virtual Machine architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the VM analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Virtual Machine Architecture Overview

### Current State
{Describe the current VM implementation:}
- VM size and series
- Operating system
- Workload type
- Availability configuration

### VM Configuration
| Setting | Current Value | Recommended | Rationale |
|---------|---------------|-------------|-----------|
| Size | {Size} | {Size} | {Reason} |
| OS | {Windows/Linux} | {OS} | {Reason} |
| Disk Type | {HDD/SSD/Premium SSD} | {Type} | {Reason} |
| Availability Zone | {Zone/Single} | {Zone} | {Reason} |

## Compute Resources

### VM Size Analysis
{Current size vs. workload requirements}

#### CPU and Memory
- Core count evaluation
- Memory allocation
- Performance requirements

#### Storage Performance
- IOPS requirements
- Throughput needs
- Latency considerations

### Scaling Considerations
- Vertical scaling options
- Horizontal scaling alternatives
- Performance monitoring

## Operating System and Configuration

### OS Configuration
{OS version, patching, and hardening}

### Security Configuration
- Security baselines
- Endpoint protection
- Access controls

### Monitoring Agent Installation
- Azure Monitor agent
- Dependency agent
- Diagnostic extensions

## Storage Architecture

### OS Disk Configuration
{Disk type, size, and performance}

### Data Disks
{Additional disk configuration and usage}

### Backup Configuration
- Azure Backup integration
- Recovery point objectives
- Retention policies

## Networking Configuration

### Network Security Groups
- Inbound/outbound rules
- Security hardening

### Network Performance
- Bandwidth requirements
- Latency optimization
- Network security

## High Availability

### Availability Sets/Zones
- Fault domain configuration
- Update domain planning

### Disaster Recovery
- Backup strategies
- Failover procedures
- Business continuity

## Cost Optimization

### Current Cost Analysis
{Breakdown of VM costs}
- Compute costs
- Storage costs
- Network costs
- License costs

### Cost Optimization Opportunities
- Right-sizing recommendations
- Reserved instances
- Spot instances
- Auto-shutdown schedules

## Security and Compliance

### Access Control
- RBAC configuration
- JIT access
- Multi-factor authentication

### Security Monitoring
- Threat detection
- Vulnerability assessment
- Compliance monitoring

## Monitoring and Management

### Azure Monitor Integration
- Performance metrics
- Health monitoring
- Alert configuration

### Update Management
- Patch management
- Update schedules
- Compliance reporting

## Workload Optimization

### Application Performance
- Application-specific tuning
- Resource optimization
- Performance monitoring

### Operational Efficiency
- Automation opportunities
- Management simplification
- Cost reduction

## Context and Problem Statement

{Describe the specific problem being addressed by this Virtual Machine decision.}

## Decision Drivers

{List the factors influencing this VM architectural decision.}

## Considered Options

{List and describe the compute options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected VM approach and rationale.}

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

- Azure Virtual Machines documentation
- VM sizing guidelines
- Cost optimization guides

## Notes

{Additional considerations}