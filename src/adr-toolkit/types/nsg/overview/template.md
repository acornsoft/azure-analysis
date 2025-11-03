# ADR {NNN}: {NSG Name} - {Decision Title}

**Partner:** {Partner Name}

**Client:** {Client Name}

**Network Security Group:** {NSG Name}

**Azure Subscription:** {Subscription ID}

**Resource Group:** {Resource Group}

**Status:** {Status}

**Date:** {Date}

## Executive Summary

### Overview

{Provide a high-level summary of the Network Security Group architecture decision and its business impact. Include security posture, traffic flow patterns, and key architectural considerations for network security.}

### Key Findings

{List the most critical findings from the deep dive analysis including security assessment, traffic analysis, and network optimization recommendations.}

### Recommended Actions

{Summarize the immediate actions and long-term recommendations for NSG optimization and security enhancement.}

## Network Security Group Architecture Overview

### Current State

{Describe the current NSG implementation, including:}

- Associated resources (VMs, subnets, NICs)
- Security rule configuration
- Traffic flow patterns
- Network topology integration
- Security monitoring and logging

### Architecture Diagram

{Include high-level architecture diagram showing:}

- Network topology and segmentation
- NSG placement and associations
- Traffic flow patterns and rules
- Security boundaries and controls
- Integration with other network security services

### Security Rules Inventory

| Priority | Direction | Protocol | Source | Destination | Port | Action | Purpose |
|----------|-----------|----------|--------|-------------|------|--------|---------|
| {100} | {Inbound} | {TCP} | {Internet} | {VirtualNetwork} | {80,443} | {Allow} | {Web traffic} |
| {200} | {Inbound} | {TCP} | {VirtualNetwork} | {VirtualNetwork} | {1433} | {Allow} | {SQL access} |
| {4096} | {Inbound} | {Any} | {Any} | {Any} | {Any} | {Deny} | {Default deny} |

## Security Rules Analysis

### Inbound Rules Assessment

{Analysis of inbound security rules:}

#### Allow Rules Evaluation

- Business justification for each allow rule
- Source IP range specificity
- Port and protocol restrictions
- Rule ordering and priority logic

#### Default Security Posture

- Default deny rule effectiveness
- Implicit deny behavior verification
- Rule conflict identification
- Overly permissive rule detection

### Outbound Rules Assessment

{Analysis of outbound security rules:}

#### Egress Traffic Control

- Outbound traffic restrictions
- Internet access controls
- Service endpoint configurations
- DNS resolution rules

#### Network Segmentation

- East-west traffic controls
- Cross-subnet communication rules
- Application tier isolation
- Database access restrictions

## Traffic Flow and Performance

### Current Traffic Patterns

{Document current network traffic characteristics:}

- Traffic volume and throughput
- Peak usage periods and patterns
- Protocol distribution (TCP/UDP/ICMP)
- Connection states and flows
- Geographic traffic distribution

### Performance Impact Analysis

{Network performance and optimization assessment:}

#### Latency and Throughput

- Network latency measurements
- Bandwidth utilization patterns
- Packet loss and retransmission rates
- Connection establishment times

#### Rule Processing Efficiency

- Rule evaluation performance
- Flow state management
- Connection tracking overhead
- Memory and CPU utilization

### Network Security Monitoring

{Current monitoring and logging configuration:}

#### Flow Logs Analysis

- NSG flow logs enablement
- Traffic analytics configuration
- Log retention and storage
- Alerting and notification setup

#### Security Event Monitoring

- Security event correlation
- Threat detection capabilities
- Incident response procedures
- Forensic analysis capabilities

## Security Posture and Compliance

### Security Assessment

{Comprehensive security posture evaluation:}

#### Defense in Depth

- Network layer security controls
- Application layer protection
- Host-based security integration
- Zero trust architecture alignment

#### Compliance Requirements

- Regulatory compliance (PCI, HIPAA, GDPR)
- Industry standards adherence
- Security framework alignment
- Audit and reporting requirements

### Threat Protection

{Advanced threat protection capabilities:}

#### Attack Prevention

- DDoS protection integration
- Malware and intrusion detection
- Suspicious traffic identification
- Automated threat response

#### Vulnerability Management

- Security rule optimization
- Configuration drift detection
- Regular security assessments
- Patch management integration

## Network Architecture Integration

### Virtual Network Integration

{NSG integration with broader network architecture:}

#### Subnet Design

- Subnet segmentation strategy
- NSG association patterns
- Route table integration
- Network peering configurations

#### Hybrid Network Connectivity

- On-premises connectivity rules
- VPN and ExpressRoute integration
- Cross-premises traffic flows
- Identity-based access controls

### Service Integration

{Integration with other Azure network services:}

#### Azure Firewall Integration

- Firewall policy coordination
- Rule consolidation opportunities
- Traffic inspection capabilities
- Centralized security management

#### Application Gateway/WAF

- Web application protection
- SSL termination configurations
- Load balancing integration
- Health monitoring rules

## Cost Optimization

### Current Cost Analysis

{Breakdown of NSG-related costs:}

- Flow logs storage costs
- Traffic analytics processing costs
- Security monitoring costs
- Additional security service costs

### Cost Optimization Opportunities

- Flow logs retention optimization
- Traffic analytics configuration tuning
- Security service consolidation
- Resource rightsizing recommendations

### Usage Pattern Analysis

- Traffic volume trends
- Security event frequency
- Monitoring data utilization
- Cost allocation by department

## Monitoring and Observability

### Current Monitoring Setup

{Application Insights and Azure Monitor configuration}

### Key Metrics to Monitor

- Security rule hit counts
- Blocked traffic volumes
- Connection attempts and failures
- Flow log data analysis
- Performance metrics and latency

### Alerting Strategy

{Critical alerts and notification channels}

### Diagnostic Logging

{Security event logging and diagnostic settings}

## Azure Well-Architected Framework Assessment

### Reliability

- Network availability and redundancy
- Failover and recovery procedures
- Service level agreements
- Disaster recovery integration

### Security

- Network security controls
- Threat protection capabilities
- Access control and authorization
- Compliance and regulatory requirements

### Cost Management

- Security service efficiency
- Monitoring cost optimization
- Resource utilization
- Budget and forecasting

### Operational Excellence

- Security monitoring and alerting
- Configuration management
- Incident response procedures
- Automation and orchestration

### Performance Efficiency

- Network performance optimization
- Security rule processing efficiency
- Traffic flow optimization
- Scaling and elasticity

## Azure Principal Architect Guidance

### Architectural Recommendations

{Strategic guidance from Azure Principal Architect perspective}

### Best Practices Implementation

{Network security best practices and implementation guidance}

### Future-Proofing Strategy

{Long-term architectural considerations and roadmap}

## Terraform Infrastructure Guidance

### Resource Configuration

{Recommended Terraform resource configurations for NSG}

### Infrastructure as Code Patterns

{IaC best practices for NSG deployment and management}

### State Management

{Terraform state management for NSG resources}

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

{Security rule optimization and performance tuning}

### Phase 3: Modernization

{Advanced security features and automation}

### Phase 4: Evolution

{Future security enhancements and scaling}

## Risks and Mitigation

### Technical Risks

{Network security, performance, and reliability risks}

### Operational Risks

{Management, monitoring, and maintenance risks}

### Business Risks

{Compliance, cost, and business continuity risks}

## Related ADRs

{List related architectural decisions that impact or are impacted by this NSG decision. References to network architecture, application security, and compliance decisions.}

## References

- Azure Network Security documentation
- NSG best practices
- Azure Well-Architected Framework
- Security guidelines
- Network optimization guides
- Cost optimization guides

## Notes

{Additional considerations, assumptions, and future work items. Include security policy decisions, network segmentation rationale, and modernization roadmap.}
