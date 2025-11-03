# ADR {NNN}: {SQL Database Name} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**SQL Database:** {SQL Database Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview

{Provide a high-level summary of the SQL Database architecture decision and its business impact. Include service tier, performance level, and key architectural considerations for this specific database.}

### Key Findings

{List the most critical findings from the deep dive analysis including performance metrics, security assessment, and database-specific recommendations.}

### Recommended Actions

{Summarize the immediate actions and long-term recommendations for SQL Database optimization and modernization.}

## SQL Database Architecture Overview

### Current State

{Describe the current SQL Database implementation, including:}

- Service tier and compute model (DTU/vCore)
- Database size and storage configuration
- Performance level and scaling configuration
- Backup and retention policies
- Geo-redundancy and high availability settings

### Architecture Diagram

{Include high-level architecture diagram showing:}

- Database connectivity and access patterns
- Application integration points
- Data flow and transformation logic
- External service dependencies
- Security boundaries and controls

### Database Schema Overview

| Schema | Tables | Views | Stored Procedures | Functions | Purpose |
|--------|--------|-------|-------------------|-----------|---------|
| {dbo} | {150} | {25} | {45} | {12} | {Main application schema} |
| {staging} | {20} | {5} | {8} | {3} | {Data loading and processing} |
| {reporting} | {0} | {35} | {15} | {8} | {Business intelligence views} |

## Database Design and Optimization

### Table Design Analysis

{Analyze the current table design and optimization:}

#### Indexing Strategy

- Clustered index design and effectiveness
- Non-clustered index coverage and usage
- Index maintenance and fragmentation
- Missing index recommendations
- Index storage and performance impact

#### Data Types and Constraints

- Appropriate data type selection
- Constraint usage (primary keys, foreign keys, check constraints)
- Default values and computed columns
- Data integrity enforcement

### Query Performance

{Current query performance characteristics:}

#### Execution Plan Analysis

- Most expensive queries identification
- Execution plan optimization opportunities
- Query plan cache analysis
- Parameter sniffing issues
- Statistics maintenance and updates

#### Query Optimization

- Stored procedure performance
- View optimization and materialization
- Common table expression (CTE) usage
- Temporary table and table variable optimization

## Performance and Scalability

### Current Performance Metrics

{Document current performance characteristics:}

- DTU/vCore utilization patterns
- Query execution times and throughput
- Connection pooling and concurrency
- Storage I/O performance
- Memory and tempdb usage

### Scaling Configuration

{Analysis of current scaling setup:}

#### Service Tier Optimization

- Current service tier evaluation
- DTU/vCore allocation assessment
- Auto-scaling configuration
- Performance baseline vs. peak usage

#### Storage Optimization

- Data file sizing and growth patterns
- Log file management and VLF counts
- Filegroup usage and partitioning
- Storage performance and IOPS allocation

### Workload Analysis

{Database workload patterns and optimization:}

- OLTP vs. OLAP workload characteristics
- Read/write ratio analysis
- Peak usage patterns and seasonality
- Resource contention identification

## Security and Access Control

### Authentication and Authorization

{Analysis of database security implementation:}

#### Database-Level Security

- SQL authentication vs. Azure AD integration
- Database roles and permissions
- Schema-level security
- Object-level permissions

#### Data Protection

- Transparent data encryption (TDE)
- Always Encrypted for sensitive columns
- Dynamic data masking implementation
- Row-level security (RLS) configuration

### Network Security

- Private endpoints configuration
- Firewall rules and IP restrictions
- Connection policies and timeouts
- TLS/SSL encryption requirements

## Data Management and Lifecycle

### Backup and Recovery

{Database backup strategy and recovery capabilities:}

#### Backup Configuration

- Automated backup schedules
- Backup retention policies
- Point-in-time restore capabilities
- Long-term retention options

#### Recovery Testing

- Recovery time objective (RTO) validation
- Recovery point objective (RPO) assessment
- Disaster recovery testing procedures

### Data Archiving and Retention

{Data lifecycle management strategies:}

- Data retention policies
- Archival procedures for historical data
- Data purging and cleanup processes
- Compliance requirements for data retention

## Monitoring and Observability

### Current Monitoring Setup

{Application Insights and Azure Monitor configuration}

### Key Metrics to Monitor

- Query performance and execution statistics
- Database size and growth trends
- DTU/vCore consumption patterns
- Deadlock and blocking incidents
- Error rates and failed connections

### Alerting Strategy

{Critical alerts and notification channels}

### Diagnostic Logging

{Audit logging and diagnostic settings}

## Cost Optimization

### Current Cost Analysis

{Breakdown of SQL Database costs:}

- Compute costs (DTU/vCore hours)
- Storage costs (data + backup)
- Data transfer costs
- Additional feature costs (geo-redundancy, long-term backup)

### Cost Optimization Opportunities

- Service tier right-sizing recommendations
- Storage optimization and cleanup
- Reserved capacity utilization
- Query optimization for cost reduction

### Usage Pattern Analysis

- Peak vs. off-peak usage patterns
- Workload consolidation opportunities
- Cost allocation and chargeback

## Integration Patterns

### Application Integration

{Client application connectivity patterns:}

- Connection string optimization
- Connection pooling strategies
- ORM configuration and tuning
- Entity Framework/Core best practices

### Service Integration

{Integration with other Azure services:}

- Azure Functions and Logic Apps
- Azure Synapse Analytics integration
- API Management connectivity
- Azure Active Directory integration

## Query Optimization and Tuning

### Index Optimization

{Comprehensive index analysis and recommendations:}

#### Index Usage Analysis

- Index usage statistics
- Unused index identification
- Index fragmentation assessment
- Fill factor optimization

#### Index Design Recommendations

- Clustered index column selection
- Non-clustered index creation
- Filtered index opportunities
- Columnstore index evaluation

### Query Performance Tuning

{Specific query optimization recommendations:}

#### Query Pattern Optimization

- SELECT statement optimization
- JOIN operation efficiency
- WHERE clause optimization
- Subquery and CTE optimization

#### Stored Procedure Optimization

- Parameter sniffing resolution
- Execution plan reuse
- Temporary object optimization
- Error handling and transaction management

## Azure Well-Architected Framework Assessment

### Reliability

- High availability configuration
- Backup and recovery procedures
- Failure mode analysis
- Service level agreements

### Security

- Authentication and authorization
- Data encryption and protection
- Network security controls
- Compliance requirements

### Cost Management

- Service tier efficiency
- Storage utilization optimization
- Resource rightsizing
- Reserved capacity utilization

### Operational Excellence

- Monitoring and alerting
- Automated scaling configuration
- Deployment and configuration management
- Incident response procedures

### Performance Efficiency

- Query optimization
- Indexing strategy effectiveness
- Resource utilization
- Scaling automation

## Azure Principal Architect Guidance

### Architectural Recommendations

{Strategic guidance from Azure Principal Architect perspective}

### Best Practices Implementation

{Database-specific best practices and implementation guidance}

### Future-Proofing Strategy

{Long-term architectural considerations and roadmap}

## Terraform Infrastructure Guidance

### Resource Configuration

{Recommended Terraform resource configurations for SQL Database}

### Infrastructure as Code Patterns

{IaC best practices for SQL Database deployment and management}

### State Management

{Terraform state management for SQL Database resources}

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

{List related architectural decisions that impact or are impacted by this SQL Database decision. References to application architecture, data modeling, and integration decisions.}

## References

- Azure SQL Database documentation
- SQL Server best practices
- Azure Well-Architected Framework
- Performance tuning guides
- Security guidelines
- Cost optimization guides

## Notes

{Additional considerations, assumptions, and future work items. Include database design decisions, query optimization rationale, and modernization roadmap.}
