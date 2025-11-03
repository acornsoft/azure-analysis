# ADR {NNN}: {Cosmos DB Account/Database Name} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Cosmos DB Account:** {Cosmos DB Account Name}

**Database:** {Database Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview

{Provide a high-level summary of the Cosmos DB architecture decision and its business impact. Include database type (NoSQL, MongoDB, Cassandra, Gremlin, Table, PostgreSQL) and key architectural considerations.}

### Key Findings

{List the most critical findings from the deep dive analysis including performance metrics, cost analysis, and architectural recommendations.}

### Recommended Actions

{Summarize the immediate actions and long-term recommendations for Cosmos DB optimization and modernization.}

## Cosmos DB Architecture Overview

### Current State

{Describe the current Cosmos DB implementation, including:}

- Database type and API (SQL, MongoDB, Cassandra, Gremlin, Table, PostgreSQL)
- Account configuration (single-region, multi-region, write regions)
- Consistency level and replication strategy
- Partitioning strategy and partition keys
- Indexing policies and throughput settings

### Architecture Diagram

{Include high-level architecture diagram showing:}

- Cosmos DB account and database structure
- Regional distribution and replication topology
- Client application connectivity patterns
- Data flow and access patterns
- Integration with other Azure services

### Database Inventory

| Database Name | API Type | Regions | Consistency Level | Total RU/s | Storage (GB) |
|---------------|----------|---------|------------------|------------|--------------|
| {Database1} | {SQL/MongoDB/etc.} | {Region1, Region2} | {Strong/Bounded/Eventual} | {400} | {100} |
| {Database2} | {SQL/MongoDB/etc.} | {Region1, Region2} | {Strong/Bounded/Eventual} | {400} | {100} |

## Data Modeling and Partitioning Strategy

### Current Data Model

{Analyze the current data model and schema design:}

#### Entity-Relationship Analysis

- Document/collection structure and relationships
- Embedded vs. referenced data patterns
- Schema evolution strategy
- Data access patterns (read-heavy, write-heavy, mixed)

#### Partitioning Strategy

- Partition key selection criteria
- Hot partition identification and mitigation
- Cross-partition queries and performance impact
- Partition key distribution analysis

### Indexing Strategy

{Current indexing configuration and optimization opportunities}

## Performance and Scalability

### Current Performance Metrics

{Document current performance characteristics:}

- Request Units (RU) consumption patterns
- Latency and throughput metrics
- Throttling events and error rates
- Query performance and execution times
- Storage utilization and growth trends

### Throughput Provisioning

{Analysis of throughput provisioning strategy:}

#### Manual vs. Autoscale

- Current provisioning model
- Peak usage patterns and scaling requirements
- Cost implications of provisioning choices
- Autoscale configuration and effectiveness

#### RU Distribution

- Per-database and per-container RU allocation
- Shared vs. dedicated throughput models
- Burst capacity utilization
- Cost optimization opportunities

### Query Optimization

{Query performance analysis and optimization recommendations}

## Consistency and Replication

### Consistency Level Analysis

{Evaluation of current consistency settings:}

#### Business Requirements Alignment

- Application consistency requirements
- Data consistency vs. performance trade-offs
- Multi-region consistency implications
- Conflict resolution strategies

#### Regional Distribution

- Write region configuration
- Read region availability and latency
- Failover strategies and RTO/RPO
- Cross-region replication costs

### Disaster Recovery

{Backup and recovery strategy analysis}

## Security and Access Control

### Authentication and Authorization

{Analysis of security implementation:}

#### Identity Management

- Azure AD integration and role assignments
- Managed identity usage
- Service principal configurations
- Least privilege access patterns

#### Network Security

- Virtual network integration
- Private endpoints configuration
- Firewall rules and IP restrictions
- Public access controls

### Data Protection

- Encryption at rest and in transit
- Customer-managed keys
- Backup encryption
- Data masking and anonymization

## Monitoring and Observability

### Current Monitoring Setup

{Application Insights and Azure Monitor configuration}

### Key Metrics to Monitor

- RU consumption and throttling
- Latency and throughput trends
- Storage growth and utilization
- Error rates and availability
- Replication lag and conflicts

### Alerting Strategy

{Critical alerts and notification channels}

### Diagnostic Logging

{Query and change feed logging configuration}

## Cost Optimization

### Current Cost Analysis

{Breakdown of Cosmos DB costs:}

- Provisioned throughput costs
- Storage costs (data + backup)
- Cross-region replication costs
- Data transfer costs

### Cost Optimization Opportunities

- Throughput right-sizing recommendations
- Storage optimization (TTL, data archiving)
- Regional deployment optimization
- Reserved capacity analysis

### Usage Pattern Analysis

- Peak vs. off-peak usage patterns
- Workload isolation opportunities
- Cost allocation and chargeback

## Integration Patterns

### Application Integration

{Client application connectivity patterns:}

- SDK usage and version analysis
- Connection pooling and retry policies
- Bulk operations and batch processing
- Change feed processor implementation

### Service Integration

{Integration with other Azure services:}

- Azure Functions and Logic Apps
- Synapse Analytics integration
- API Management integration
- Event Grid and Service Bus integration

## Migration and Modernization

### Legacy System Integration

{Strategies for migrating from other databases}

### Technology Stack Evolution

{Planning for API changes and feature updates}

### Cloud-Native Patterns

{Adoption of cloud-native data patterns}

## Compliance and Regulatory Considerations

{GDPR, HIPAA, SOX, or other compliance requirements affecting data storage and processing}

## Testing Strategy

### Performance Testing

{Load testing and performance validation}

### Chaos Engineering

{Fault injection and resilience testing}

### Data Integrity Testing

{Data consistency and integrity validation}

## Disaster Recovery and Business Continuity

### Backup Strategy

{Cosmos DB backup configuration and retention}

### High Availability

{Multi-region deployment and failover strategies}

### Business Continuity Planning

{Disaster recovery procedures and communication plans}

## Azure Well-Architected Framework Assessment

### Reliability

- Multi-region deployment strategy
- Availability zone configuration
- Backup and recovery procedures
- Failure mode analysis

### Security

- Authentication and authorization
- Data encryption and protection
- Network security controls
- Compliance requirements

### Cost Management

- Throughput provisioning efficiency
- Storage utilization optimization
- Regional cost optimization
- Reserved capacity utilization

### Operational Excellence

- Monitoring and alerting
- Automated scaling configuration
- Deployment and configuration management
- Incident response procedures

### Performance Efficiency

- Query optimization
- Partitioning strategy effectiveness
- Throughput utilization
- Latency optimization

## Azure Principal Architect Guidance

### Architectural Recommendations

{Strategic guidance from Azure Principal Architect perspective}

### Best Practices Implementation

{Service-specific best practices and implementation guidance}

### Future-Proofing Strategy

{Long-term architectural considerations and roadmap}

## Terraform Infrastructure Guidance

### Resource Configuration

{Recommended Terraform resource configurations for Cosmos DB}

### Infrastructure as Code Patterns

{IaC best practices for Cosmos DB deployment and management}

### State Management

{Terraform state management for Cosmos DB resources}

## Resource Health Diagnosis

### Health Check Procedures

{Step-by-step resource health assessment}

### Common Issues and Resolutions

{Frequent problems and troubleshooting guidance}

### Proactive Monitoring

{Health monitoring and alerting recommendations}

## Implementation Plan

### Phase 1: Assessment and Planning

{Current state assessment and planning}

### Phase 2: Optimization

{Performance and cost optimization}

### Phase 3: Modernization

{Architecture modernization and feature adoption}

### Phase 4: Evolution

{Future scalability and enhancement}

## Risks and Mitigation

### Technical Risks

{Performance, scalability, and reliability risks}

### Operational Risks

{Management, monitoring, and maintenance risks}

### Business Risks

{Cost, compliance, and business continuity risks}

## Related ADRs

{List related architectural decisions that impact or are impacted by this Cosmos DB decision. References to data modeling, API design, and integration decisions.}

## References

- Azure Cosmos DB documentation
- Azure Well-Architected Framework
- Data modeling best practices
- Performance optimization guides
- Security guidelines
- Cost optimization guides

## Notes

{Additional considerations, assumptions, and future work items. Include data modeling decisions, partitioning strategy rationale, and migration considerations.}
