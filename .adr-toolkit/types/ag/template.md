# ADR {NNN}: {Action Group} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Action Group:** {Group Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Action Group architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the alerting analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Action Group Architecture Overview

### Current State
{Describe the current Action Group implementation:}
- Notification channels configured
- Integration with monitoring services
- Alert routing patterns
- Escalation procedures

### Action Group Configuration
| Action Type | Configuration | Purpose | Recipients |
|-------------|---------------|---------|------------|
| Email | {Settings} | {Purpose} | {Recipients} |
| SMS | {Settings} | {Purpose} | {Recipients} |
| Webhook | {Settings} | {Purpose} | {URL} |
| ITSM | {Settings} | {Purpose} | {System} |

## Notification Channels

### Email Notifications
{Email configuration and usage patterns}

#### Distribution Lists
- Alert recipients
- Escalation contacts
- On-call rotations

#### Email Templates
- Alert formatting
- Information inclusion
- Branding requirements

### SMS Notifications
{Critical alert SMS configuration}

### Webhook Integrations
{External system integrations}

#### ITSM Integration
- ServiceNow integration
- Jira Service Desk
- Custom ticketing systems

#### Automation Integration
- Logic Apps integration
- Automation runbooks
- Remediation workflows

## Alert Routing and Escalation

### Alert Severity Levels
- Critical alerts
- Warning alerts
- Informational alerts

### Escalation Procedures
- Initial notification
- Follow-up alerts
- Management escalation
- Crisis response

### Alert Suppression
- Maintenance windows
- Known issue suppression
- Noise reduction

## Integration with Azure Monitor

### Alert Rules Integration
{Connection with metric alerts and log alerts}

### Action Group Usage Patterns
- Per-service action groups
- Environment-specific groups
- Role-based notifications

## Security and Compliance

### Access Control
- RBAC configuration
- Action group permissions
- Secure webhook endpoints

### Data Protection
- Sensitive data handling
- Encryption requirements
- Audit logging

## Cost Analysis

### Current Costs
{Action Group operational costs}

### Optimization Opportunities
- Notification efficiency
- Channel optimization
- Alert volume management

## Monitoring and Analytics

### Alert Effectiveness
- Response time tracking
- Resolution metrics
- False positive analysis

### Usage Analytics
- Alert volume trends
- Channel utilization
- Escalation patterns

## Context and Problem Statement

{Describe the specific problem being addressed by this Action Group decision.}

## Decision Drivers

{List the factors influencing this alerting architectural decision.}

## Considered Options

{List and describe the notification options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected alerting approach and rationale.}

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
- Alerting best practices
- Incident response guidelines

## Notes

{Additional considerations}