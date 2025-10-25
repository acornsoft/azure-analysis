# ADR {NNN}: {Service Bus Subscription} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Service Bus Subscription:** {Subscription Name}

**Topic:** {Topic Name}

**Namespace:** {Namespace Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Service Bus subscription architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the subscription analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Subscription Architecture Overview

### Current State
{Describe the current subscription implementation:}
- Subscription configuration
- Filter rules and actions
- Consumer application
- Processing patterns

### Subscription Configuration Details
| Property | Current Value | Recommended | Rationale |
|----------|---------------|-------------|-----------|
| Lock Duration | {Value} | {Value} | {Reason} |
| Max Delivery Count | {Value} | {Value} | {Reason} |
| Message TTL | {Value} | {Value} | {Reason} |
| Session Support | {Enabled/Disabled} | {Setting} | {Reason} |

## Message Filtering and Routing

### Filter Rules
{Document filter expressions:}

#### SQL Filters
```sql
{Filter Expression}
```

#### Correlation Filters
{Property-based filtering}

#### Rule Actions
{Message property modifications}

### Filtering Performance
{Filter evaluation impact and optimization}

## Consumer Application Analysis

### Consumer Type
- Single consumer
- Competing consumers
- Batch processor
- Event processor

### Processing Patterns
- Peek-lock processing
- Receive-and-delete
- Session-based processing
- Transactional processing

### Error Handling
- Dead letter queue usage
- Retry logic
- Poison message handling

## Performance Characteristics

### Throughput Metrics
- Messages per second
- Processing latency
- Queue depth
- Error rates

### Scalability Patterns
- Consumer scaling
- Partition handling
- Load distribution

## Reliability and Durability

### Message Delivery Guarantees
- At-least-once delivery
- At-most-once delivery
- Exactly-once processing

### Failure Recovery
- Message replay
- State management
- Checkpointing

## Monitoring and Alerting

### Key Metrics
- Message count
- Processing rate
- Dead letter growth
- Lock timeouts

### Alert Configuration
- Processing delays
- Error thresholds
- Queue depth alerts

## Cost Analysis

### Current Costs
- Message operations
- Data transfer
- Storage costs

### Optimization Opportunities
- Processing efficiency
- Message size optimization
- Dead letter management

## Context and Problem Statement

{Describe the specific problem being addressed by this subscription decision.}

## Decision Drivers

{List the factors influencing this subscription architectural decision.}

## Considered Options

{List and describe the subscription options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected subscription approach and rationale.}

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
- Subscription patterns
- Performance guidelines

## Notes

{Additional considerations}