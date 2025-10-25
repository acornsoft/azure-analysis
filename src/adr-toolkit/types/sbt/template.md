# ADR {NNN}: {Service Bus Topic} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Service Bus Topic:** {Topic Name}

**Namespace:** {Namespace Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Service Bus topic architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the topic analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Topic Architecture Overview

### Current State
{Describe the current topic implementation:}
- Topic configuration and properties
- Publishing patterns
- Subscription relationships
- Message routing logic

### Topic Configuration Details
| Property | Current Value | Recommended | Rationale |
|----------|---------------|-------------|-----------|
| Max Size | {Value} | {Value} | {Reason} |
| Message TTL | {Value} | {Value} | {Reason} |
| Duplicate Detection | {Enabled/Disabled} | {Setting} | {Reason} |
| Partitioning | {Enabled/Disabled} | {Setting} | {Reason} |

## Publishing Patterns

### Publisher Applications
{Document applications publishing to this topic}

### Message Schemas
{Document message formats and versioning}

### Publishing Patterns
- Fire-and-forget
- Guaranteed delivery
- Transactional publishing
- Batch publishing

## Subscription Analysis

### Subscription Inventory
| Subscription Name | Filter Rules | Consumer | Purpose |
|-------------------|--------------|----------|---------|
| {Sub1} | {Filter} | {Consumer} | {Purpose} |
| {Sub2} | {Filter} | {Consumer} | {Purpose} |

### Subscription Patterns
- Filtered subscriptions
- Catch-all subscriptions
- Dead letter subscriptions
- Auto-forwarding subscriptions

## Message Routing and Filtering

### Filter Rules
{Document SQL filter expressions and correlation filters}

### Routing Logic
- Content-based routing
- Header-based routing
- Property-based routing

### Performance Impact
{Filter evaluation performance and optimization}

## Scalability Considerations

### Throughput Analysis
- Publishing rate
- Subscription throughput
- Partition scaling

### Consumer Scaling
- Subscription scaling patterns
- Load balancing
- Backpressure handling

## Reliability Patterns

### Message Durability
- Topic persistence
- Subscription durability
- Message replay capabilities

### Error Handling
- Dead letter topics
- Retry policies
- Circuit breaker patterns

## Security and Compliance

### Access Control
- Topic-level permissions
- Subscription permissions
- Network security

### Data Protection
- Message encryption
- Compliance requirements
- Audit logging

## Monitoring and Observability

### Key Metrics
- Publishing rate
- Subscription metrics
- Message latency
- Error rates

### Alerting
- Topic depth alerts
- Publishing failures
- Subscription issues

## Cost Optimization

### Current Costs
- Topic operations
- Data transfer
- Storage costs

### Optimization Opportunities
- Message size optimization
- Subscription efficiency
- Storage tier management

## Context and Problem Statement

{Describe the specific problem being addressed by this topic decision.}

## Decision Drivers

{List the factors influencing this topic architectural decision.}

## Considered Options

{List and describe the topic options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected topic approach and rationale.}

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

- Azure Service Bus documentation
- Publish-subscribe patterns
- Performance guidelines

## Notes

{Additional considerations}