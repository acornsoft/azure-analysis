# ADR {NNN}: {Service Bus Queue} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Service Bus Queue:** {Queue Name}

**Namespace:** {Namespace Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview
{Provide a high-level summary of the Service Bus queue architecture decision and its business impact.}

### Key Findings
{List the most critical findings from the queue analysis.}

### Recommended Actions
{Summarize the immediate actions and long-term recommendations.}

## Queue Architecture Overview

### Current State
{Describe the current queue implementation:}
- Queue configuration and properties
- Message patterns and throughput
- Consumer applications
- Error handling strategy

### Queue Configuration Details
| Property | Current Value | Recommended | Rationale |
|----------|---------------|-------------|-----------|
| Max Size | {Value} | {Value} | {Reason} |
| Message TTL | {Value} | {Value} | {Reason} |
| Lock Duration | {Value} | {Value} | {Reason} |
| Duplicate Detection | {Enabled/Disabled} | {Setting} | {Reason} |

## Message Processing Patterns

### Message Types and Schemas
{Document message formats and schemas used}

### Processing Patterns
- At-least-once delivery
- At-most-once delivery
- Exactly-once processing
- Ordered message processing

### Consumer Patterns
- Competing consumers
- Single consumer
- Batch processing
- Session-based processing

## Performance Characteristics

### Throughput Analysis
- Current message rate
- Peak load patterns
- Processing latency
- Queue depth trends

### Scalability Considerations
- Consumer scaling
- Partitioning strategy
- Message size optimization

## Reliability and Durability

### Message Persistence
- Message durability settings
- Storage redundancy
- Data retention policies

### Error Handling
- Dead letter queue configuration
- Poison message handling
- Retry policies

### Disaster Recovery
- Message backup strategies
- Failover procedures
- Data consistency

## Security Considerations

### Access Control
- SAS policies
- RBAC assignments
- Network restrictions

### Message Encryption
- In-transit encryption
- At-rest encryption
- Key management

## Monitoring and Alerting

### Key Metrics
- Message count
- Processing rate
- Error rates
- Queue depth

### Alert Configuration
- Queue depth thresholds
- Processing delays
- Error rate alerts

## Cost Analysis

### Current Costs
- Message operations
- Data transfer
- Storage costs

### Optimization Opportunities
- Message size reduction
- Processing efficiency
- Storage tier optimization

## Context and Problem Statement

{Describe the specific problem being addressed by this queue decision.}

## Decision Drivers

{List the factors influencing this queue architectural decision.}

## Considered Options

{List and describe the queue options that were considered.}

## Decision Outcome

### Chosen Option: "{Option Name}"

{Describe the selected queue approach and rationale.}

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
- Queue patterns
- Performance guidelines

## Notes

{Additional considerations}