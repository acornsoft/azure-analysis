# ADR 001: D365-Snowflake-D Pipeline Analysis for One Customer

**Partner:** Accenture
**Client:** Ecolab
**Engagement:** D365-Snowflake-D Pipeline Analysis for One Customer
**Confidentiality:** Accenture Confidential

## Executive Summary

This ADR documents the current state analysis of the D365-Snowflake-D Azure Data Factory (ADF) pipeline, which serves as the production environment for Ecolab's One Customer program. The pipeline currently supports comprehensive customer account management, product data integration, and service activity processing across multiple Ecolab business entities. While the pipeline demonstrates advanced ETL capabilities with Snowflake integration and Dynamics 365 CRM connectivity, it requires enhancements to fully support One Customer requirements including NSAP to EBS account conversions, enhanced monitoring, and real-time processing capabilities. The recommended future state enhancements will transform the pipeline into a robust, enterprise-grade data integration solution that supports unified customer management across Ecolab's global operations.

## Context and Problem Statement

The D365-Snowflake-D pipeline is a comprehensive ETL solution that integrates Snowflake data warehouse with Dynamics 365 CRM, supporting Ecolab's One Customer program through automated data synchronization and transformation processes.

### Business Context

Ecolab's One Customer program requires a unified customer data platform that supports seamless account management across all business divisions and global regions. The D365-Snowflake-D pipeline currently provides the foundation for this unified approach by integrating multiple data sources and supporting complex customer relationship management.

### Current State Technical Context

The existing pipeline operates with:
- **Advanced ETL Architecture**: Complex data flows supporting multiple entity types (customers, products, services, corporate accounts)
- **Snowflake Integration**: Direct connectivity to Snowflake views and tables for enterprise data access
- **Multi-Entity Support**: Comprehensive handling of accounts, products, services, and organizational hierarchies
- **Batch Processing**: Scheduled and event-driven data synchronization with staging layer processing
- **Enterprise Monitoring**: Basic logging and error handling with some operational visibility

### Future State Technical Context

The enhanced pipeline must support:
- **NSAP to EBS Conversion**: Account type conversions for unified customer management
- **Real-Time Processing**: Event-driven processing with Service Bus integration for immediate notifications
- **Enhanced Monitoring**: Comprehensive logging, alerting, and dashboard capabilities
- **Advanced Data Quality**: Automated validation, deduplication, and enrichment with business rules
- **Scalability**: Support for growing data volumes and additional business divisions

### Problem Statement

While the D365-Snowflake-D pipeline provides a solid foundation for One Customer operations, it has several gaps that prevent full realization of the program's objectives:
- Lack of NSAP to EBS account conversion capabilities
- Limited real-time processing and event-driven workflows
- Insufficient monitoring and alerting for operational visibility
- Manual intervention requirements for complex data scenarios
- No automated data quality validation frameworks

### Decision Drivers

* **One Customer Business Requirements**: Support unified customer management across all Ecolab divisions
* **Data Quality and Accuracy**: Ensure 100% data integrity for customer operations and reporting
* **Operational Excellence**: Real-time monitoring, automated error handling, and proactive alerting
* **Scalability and Performance**: Handle growing data volumes while maintaining SLA compliance
* **Compliance and Governance**: Maintain audit trails and support regulatory requirements

## Considered Options

* **Option 1: Maintain Current State** - Continue operating with existing pipeline capabilities and manual processes for One Customer enhancements
* **Option 2: Incremental Enhancement** - Add One Customer features incrementally while maintaining current operations
* **Option 3: Comprehensive Future State Transformation** - Complete pipeline redesign to fully support One Customer requirements

## Decision Outcome

**Chosen option:** **"Option 3: Comprehensive Future State Transformation"**, because it provides the complete One Customer capabilities required for unified customer management while establishing a robust, scalable foundation for future business needs.

### Rationale

The comprehensive transformation is essential because One Customer requirements demand fundamental changes to the pipeline architecture. The current implementation lacks critical capabilities like NSAP to EBS conversion and real-time monitoring. Incremental enhancements would create technical debt and operational complexity, while maintaining the current state would prevent Ecolab from achieving One Customer objectives. The comprehensive approach ensures all requirements are met with a future-proof architecture.

## Current State Analysis

### Pipeline Architecture Deep Dive

The D365-Snowflake-D pipeline represents a sophisticated, enterprise-grade ETL solution with the following detailed architecture:

#### Pipeline Inventory (27 Active Pipelines)
**Customer Account Management:**
- `CustomerAccount_Update_Pipeline`: Core customer account processing with incremental updates
- `EBS_Account_Update`: EBS-specific account synchronization
- `ShipTo_Create_Update_Pipeline`: Ship-To account lifecycle management
- `SoldTo_Staging_to_CRM`: Sold-To account staging and CRM loading

**Product Management:**
- `Product_Pipeline`: Product master data processing
- `ProductSalesOrg_Pipeline`: Product sales organization relationships
- `EBS_Product_Pipeline_Test`: EBS product data testing and validation
- `EBS_ProductSalesOrg_Pipeline_Test`: Product sales org testing

**Corporate and Organizational:**
- `CorporateAccount_Pipeline`: Corporate account hierarchy management
- `CorporateManager_Pipeline`: Corporate manager assignments
- `SBU_Pipeline`: Strategic Business Unit processing
- `SINC_Pipeline`: SINC (business segment) management

**Service and Revenue:**
- `CPQ_BillToAccount_Pipeline`: Bill-To account processing for CPQ
- `CPQ_PayerAccount_Pipeline`: Payer account management
- `EBS_Revenue_Staging_to_CRM`: Revenue data staging and loading

**Utility and Support:**
- `FailureNotificationPipeline`: Error handling and notification
- `DataMigration_Pipeline`: General data migration utilities

#### Data Flow Complexity Analysis (24 Data Flows)

**High-Complexity Data Flows (8+ sources):**
- `Account_DF`: 8 sources, complex joins for customer account processing
- `ShipToAcc_Create_Update_DF`: 10 sources, multi-entity relationship management
- `CreateUpdateBillToAcc_DF`: Complex billing account logic
- `CreateUpdatePayerAcc_DF`: Payer account processing with financial logic

**Medium-Complexity Data Flows (4-7 sources):**
- `Products_Create_Update_DF`: Product lifecycle management
- `Product_SalesOrg_Create_Update_DF`: Sales organization relationships
- `Corporate_Acct_DF`: Corporate hierarchy processing
- `Corporate_Mngr_DF`: Manager assignment logic

**Specialized Data Flows:**
- `One_Customer_Update_DF`: One Customer indicator processing
- `Customer_to_Prospect_DF`: Customer lifecycle transitions
- `Revenue_DF`: Financial data processing
- `CustAssetDataLoad`: Customer asset management

#### Dataset Architecture (50+ Datasets)

**Snowflake Source Datasets (SF_ prefix):**
- Customer: `SF_Account`, `SF_Customer_Acc_SoldTo`, `SF_ShipTo_Acc`
- Product: `SF_Products`
- Corporate: `SF_CorporateAccVw`, `SF_CorporateMngrVw`
- Service: `SF_SBUVw`, `SF_SINCVw`
- Financial: `SF_Revenue`, `SF_CPQ_Acc`

**CRM Reference Datasets (NW_ prefix):**
- Core: `NW_Accounts`, `NW_Products`, `NW_SystemUser`
- Geographic: `NW_Country`, `NW_StateProvince`, `NW_District`
- Organizational: `NW_SalesOrg`, `NW_SBU`, `NW_SINC`, `NW_ERPSystem`
- Service: `NW_ServiceActivity`, `NW_ReoccuringService`

**Staging and Processing Datasets:**
- Account staging: `EBSAccountStagingSink`, `ShipToStagingBlobSink`
- Product staging: `ProductStagingBlobSink`, `EBSProductsStaging_Sink`
- Logging: `StagingSuccessLogDS`, `StagingErrorDS`

#### Integration Patterns

**Snowflake Connectivity:**
- Primary database: `ENT_GLBL_COM_PRD_ANALYTICS_DB`
- Authentication: Service account with role-based access (`CDS_INDS_CRMD_PRD_READR_FR`)
- Query patterns: Complex SQL with joins, aggregations, and filtering
- Incremental processing: Date-based filtering with `lastChangedDate` parameters

**CRM Integration:**
- Environment: `ecolabqa.crm.dynamics.com` (staging environment)
- Authentication: Office 365 with service account
- Query patterns: FetchXML for reference data, upsert for data loading
- Custom entities: Support for Ecolab-specific fields and relationships

**Storage Integration:**
- Primary storage: Azure Data Lake Storage Gen2
- Staging patterns: CSV-based intermediate storage
- Error handling: Separate error and success logging

#### Processing Patterns

**Batch Processing:**
- Schedule-based execution (daily at 1 AM UTC)
- Memory-optimized compute (32 cores for complex transformations)
- Staging layer processing with intermediate file storage
- Sequential pipeline dependencies with error handling

**Data Quality Patterns:**
- Reference data lookups for validation
- Business rule implementation through expressions
- Conditional splits for create vs. update logic
- Error tolerance with schema drift handling

**Monitoring Patterns:**
- Basic execution logging
- Success/failure file tracking
- Error notification pipelines
- Manual intervention points for complex scenarios

### Current State Capabilities Assessment

#### Strengths
- **Comprehensive Entity Coverage**: Supports 20+ entity types across customer, product, service, and organizational domains
- **Enterprise Data Integration**: Robust Snowflake connectivity with complex query capabilities
- **Scalable Processing**: Memory-optimized compute configurations for large dataset processing
- **Flexible Architecture**: Modular pipeline and data flow design allowing for extension
- **Data Quality Framework**: Reference data validation and business rule implementation

#### Limitations
- **Real-time Processing Gap**: Limited event-driven capabilities, primarily batch-oriented
- **Monitoring Deficiency**: Basic logging without comprehensive alerting or dashboards
- **NSAP to EBS Conversion**: Missing account type conversion capabilities
- **Error Recovery**: Limited automated error handling and recovery mechanisms
- **Operational Visibility**: Manual monitoring requirements and limited automation

### One Customer Gaps Analysis

#### Missing Capabilities
1. **Account Type Conversion**: No NSAP to EBS account conversion logic
2. **Real-time Synchronization**: Lack of event-driven processing for immediate updates
3. **Advanced Monitoring**: No Service Bus integration or comprehensive alerting
4. **Data Quality Automation**: Manual validation processes without automated frameworks
5. **Hierarchical Processing**: Limited support for complex organizational relationships

#### Technical Debt Areas
1. **Hardcoded Logic**: Business rules embedded in data flows rather than configurable
2. **Limited Testing**: No automated testing frameworks for data transformations
3. **Documentation Gaps**: Incomplete pipeline and data flow documentation
4. **Performance Optimization**: Potential for optimization in large dataset processing

## Technical Architecture

### Current State Architecture

The existing D365-Snowflake-D pipeline implements a comprehensive ETL architecture:

**Source Layer:**
- Snowflake data warehouse with multiple views (SF_Account, SF_Products, SF_Revenue, etc.)
- Dynamics 365 CRM entities for reference data and existing records
- Azure Data Lake Storage for staging and intermediate processing

**Transformation Layer:**
- Complex ADF data flows with multiple sources, joins, and transformations
- Support for customer accounts, products, services, and organizational data
- Snowflake queries with business logic and data filtering
- CRM fetchXML queries for reference data integration

**Target Layer:**
- Dynamics 365 CRM entities (accounts, products, service activities, etc.)
- Azure Data Lake Storage for staging outputs
- Error handling and logging datasets

**Supporting Infrastructure:**
- Azure Data Lake Storage for staging
- Azure Key Vault for credential management
- Schedule-based and event-driven triggers

### Data Flow Patterns

**Customer Account Processing:**
1. Extract from Snowflake views (SF_Account, SF_Customer_Acc_SoldTo)
2. Join with CRM reference data (countries, users, ERP systems)
3. Apply business rules and transformations
4. Load to CRM accounts with upsert operations

**Product and Sales Organization Processing:**
1. Extract product data from Snowflake (SF_Products)
2. Process sales organization relationships
3. Handle product hierarchies and classifications
4. Load to CRM products and sales organization entities

**Service Activity Processing:**
1. Extract service data from Snowflake sources
2. Process recurring services and activities
3. Handle service type and task relationships
4. Load to CRM service entities

### Integration Points

**Snowflake Integration:**
- Direct connectivity to Snowflake views using query-based datasets
- Support for complex SQL queries with joins and filtering
- Parameterized queries for incremental processing

**CRM Integration:**
- FetchXML queries for reference data retrieval
- Upsert operations for data synchronization
- Support for custom entities and fields

**Monitoring and Logging:**
- Basic pipeline execution logging
- Error handling with failure notifications
- Success/failure tracking datasets

## Decision Outcome

**Chosen Option: Option 3 - Comprehensive Future State Transformation**

After comprehensive analysis of the current D365-Snowflake-D pipeline capabilities and One Customer requirements, we have decided to implement **Option 3: Comprehensive Future State Transformation**. This decision is based on the following key factors:

### Rationale for Decision

1. **Strategic Alignment**: The comprehensive approach directly supports Ecolab's One Customer vision, providing unified customer management across all divisions and systems.

2. **Technical Foundation**: The existing pipeline provides a solid foundation with proven Snowflake integration, CRM connectivity, and enterprise-scale processing capabilities.

3. **Business Criticality**: NSAP to EBS conversion and real-time synchronization are essential for operational efficiency and cannot be deferred.

4. **Scalability Requirements**: The current architecture demonstrates capability to handle complex transformations at enterprise scale, supporting future growth.

5. **Risk Mitigation**: Phased implementation approach minimizes business disruption while ensuring comprehensive solution delivery.

### Key Success Factors

- **Complete One Customer Support**: Full implementation of NSAP to EBS conversion and real-time capabilities
- **Enterprise Scalability**: Proven architecture supporting multi-division, multi-entity processing
- **Operational Excellence**: Advanced monitoring, automated error recovery, and comprehensive alerting
- **Future-Proof Architecture**: Modern, maintainable design supporting ongoing business evolution

### Implementation Commitment

The comprehensive transformation will be executed through a structured 6-phase approach over 20 weeks, with extensive testing, stakeholder validation, and rollback capabilities to ensure successful delivery of One Customer capabilities.

## Pros and Cons of the Options

### Option 1: Maintain Current State

* **Business Benefits**: Minimal disruption to existing operations, low implementation cost
* **Technical Advantages**: No changes required, maintains current stability
* **Good, because**: Avoids implementation risks and maintains operational continuity
* **Business Risks**: Cannot support One Customer enhancements, limits business growth
* **Technical Challenges**: Increasing technical debt, manual processes remain
* **Bad, because**: Prevents achievement of One Customer objectives

### Option 2: Incremental Enhancement

* **Business Benefits**: Gradual improvement of capabilities, reduced business disruption
* **Technical Advantages**: Lower risk implementation, maintains some operational continuity
* **Good, because**: Allows testing of new features while maintaining current operations
* **Business Risks**: Extended timeline for full One Customer support, potential inconsistencies
* **Technical Challenges**: Complex migration path, potential for technical debt accumulation
* **Bad, because**: Delays full realization of One Customer benefits

### Option 3: Comprehensive Future State Transformation

* **Business Benefits**: Complete One Customer support, unified customer management, enhanced operational efficiency
* **Technical Advantages**: Modern architecture, comprehensive monitoring, scalable design
* **Good, because**: Provides complete solution for current and future business needs
* **Business Risks**: Higher implementation complexity and timeline
* **Technical Challenges**: Requires comprehensive testing and team training
* **Bad, because**: Higher upfront investment and potential for implementation delays

## Consequences

### Positive Consequences

* **Business Impact**: Enhanced One Customer capabilities, improved data quality, unified customer management
* **Technical Impact**: Modern architecture, comprehensive monitoring, scalable design
* **Operational Impact**: Automated processing, reduced manual intervention, improved visibility

### Negative Consequences

* **Business Impact**: Implementation timeline and resource requirements
* **Technical Impact**: Architecture changes, testing complexity, potential downtime
* **Operational Impact**: Training requirements, process changes, temporary operational constraints

### Risk Mitigation

* **Phased Implementation**: Roll out enhancements incrementally to minimize disruption
* **Comprehensive Testing**: Extensive testing of new capabilities before production deployment
* **Rollback Planning**: Detailed rollback procedures for failed implementations
* **Stakeholder Communication**: Regular updates and training for impacted teams

## Implementation Roadmap

### Phase 1: Current State Assessment and Planning (Weeks 1-2)
- Complete detailed analysis of current D365-Snowflake-D pipeline capabilities
- Document all gaps between current state and One Customer requirements
- Develop comprehensive requirements specification for enhancements
- Establish project timeline and resource requirements
- Create detailed implementation plan with milestones

### Phase 2: Foundation Architecture Enhancement (Weeks 3-6)
- Implement Azure Service Bus integration for real-time event processing
- Enhance Azure Key Vault integration with automated secret management
- Upgrade ADF data flows with advanced transformation capabilities
- Establish comprehensive logging and alerting framework

### Phase 3: NSAP to EBS Conversion Implementation (Weeks 7-10)
- Develop NSAP to EBS account conversion logic and data flows
- Implement advanced data quality validation and deduplication
- Create hierarchical relationship management capabilities
- Build incremental processing and change data capture features

### Phase 4: Enhanced Monitoring and Operations (Weeks 11-14)
- Implement real-time dashboard and alerting capabilities
- Develop automated error recovery and rollback procedures
- Create performance monitoring and optimization features
- Establish operational runbooks and support procedures

### Phase 5: Multi-Division Extension and Optimization (Weeks 15-18)
- Extend pipeline capabilities to support additional Ecolab divisions
- Implement advanced scalability and performance optimizations
- Conduct end-to-end integration testing across all supported entities
- Perform user acceptance testing with business stakeholders

### Phase 6: Deployment and Go-Live (Weeks 19-20)
- Execute phased deployment to production environment
- Implement comprehensive monitoring and support procedures
- Conduct post-deployment validation and performance monitoring
- Provide operational training to support teams
- Establish ongoing maintenance and enhancement procedures

## Risk Assessment

### High-Risk Items

* **Data Integrity During NSAP to EBS Conversion**: Complex account transformations could result in data loss or corruption
  * **Impact**: Critical - Could affect customer operations and billing accuracy
  * **Probability**: High
  * **Mitigation**: Comprehensive testing with production data samples, phased rollout with rollback capabilities, and detailed audit logging

* **Performance Degradation with Enhanced Processing**: Advanced transformations and monitoring may impact pipeline performance
  * **Impact**: High - Could violate SLA requirements for data synchronization
  * **Probability**: Medium
  * **Mitigation**: Performance testing with production-scale data, optimization of data flows, and resource scaling capabilities

* **Service Bus Integration Complexity**: Real-time monitoring implementation may introduce system instability
  * **Impact**: Medium - Reduced operational visibility during implementation
  * **Probability**: Medium
  * **Mitigation**: Phased implementation of monitoring features, comprehensive testing, and fallback to existing logging mechanisms

* **Multi-Entity Data Consistency**: Ensuring consistent data quality across accounts, products, and services
  * **Impact**: High - Inconsistent data across CRM entities
  * **Probability**: Medium
  * **Mitigation**: Unified data quality framework, cross-entity validation processes, and centralized governance

### Risk Monitoring

- **Weekly Risk Assessment Reviews**: Evaluate risk status and effectiveness of mitigation strategies
- **Automated Monitoring Implementation**: Real-time alerts for system health and data quality metrics
- **Technical Review Checkpoints**: Architecture and code reviews at key implementation milestones
- **Business Validation Gates**: Stakeholder reviews to ensure business requirements are met
- **Contingency Planning**: Multiple rollback strategies and alternative processing methods

## Stakeholder Impact

### Impacted Stakeholders

* **Business Stakeholders**: Enhanced One Customer capabilities, improved data visibility
* **Technical Teams**: Architecture modernization, new monitoring capabilities
* **Operations Teams**: Automated processing, reduced manual intervention
* **End Users**: Better data quality, unified customer management
* **Data Analysts**: Enhanced reporting capabilities, real-time insights

### Communication Plan

* **Weekly Status Updates**: Regular progress reports to stakeholders
* **Technical Review Sessions**: Architecture and design reviews with technical teams
* **Business Validation Sessions**: Feature demonstrations and validation with business users
* **Training Sessions**: Operational training for support and maintenance teams
* **Change Management**: Process documentation and user adoption support

## Testing Strategy

### Testing Approach

* **Unit Testing**: Individual data flow transformations with sample data
* **Integration Testing**: End-to-end pipeline execution across all entity types
* **User Acceptance Testing**: Business validation of One Customer enhancements
* **Performance Testing**: Load testing with production-scale data volumes
* **Regression Testing**: Validation of existing functionality after enhancements

### Success Criteria

* **Data Accuracy**: 100% match between source and target systems
* **Processing Performance**: Meet or exceed current SLA requirements
* **System Reliability**: >99.9% successful execution rate
* **Monitoring Coverage**: 100% of critical processes monitored
* **User Satisfaction**: >95% positive feedback on new capabilities

## Rollback Plan

### Rollback Triggers

* Critical data quality issues affecting business operations
* Performance degradation violating SLA requirements
* System instability preventing normal operations
* Security vulnerabilities requiring immediate remediation

### Rollback Procedure

1. **Assessment**: Evaluate impact and determine rollback scope
2. **Communication**: Notify stakeholders of rollback decision and timeline
3. **Execution**: Revert to previous pipeline version using ADF deployment
4. **Validation**: Verify system stability and data integrity
5. **Monitoring**: Monitor system performance post-rollback

### Rollback Timeline

* **Critical Issues**: 4-hour rollback execution
* **Major Issues**: 24-hour rollback execution
* **Minor Issues**: 72-hour rollback execution

## Success Metrics

### Business Metrics

* **One Customer Data Completeness**: 100% of required customer data fields populated
* **NSAP to EBS Conversion Success Rate**: >99% successful account conversions
* **Cross-Entity Data Consistency**: 100% consistency across accounts, products, and services
* **Business User Satisfaction**: >95% positive feedback on system capabilities

### Technical Metrics

* **Pipeline Reliability**: >99.9% successful execution rate with comprehensive error recovery
* **Data Processing Performance**: Maintain or improve current execution times
* **Real-Time Monitoring Coverage**: 100% of critical pipeline activities monitored
* **System Availability**: 99.9% uptime with automated failover capabilities

### Operational Metrics

* **Incident Response Time**: <15 minutes average detection time for pipeline failures
* **Data Quality Issue Resolution**: <2 hours average time to resolve data quality issues
* **Monitoring Alert Accuracy**: >98% of alerts represent genuine issues
* **Operational Efficiency**: 50% reduction in manual intervention requirements

## More Information

* **Related Documents**:
  - d365-pzmigration-analysis.md (Reference pipeline analysis and patterns)
  - d365-shipto-to-soldto-requirement.md (NSAP to EBS conversion requirements)
  - d365-custom-fields-acceptance-criteria.md (CRM field implementation requirements)
  - service-bus-integration.md (Monitoring and alerting architecture)

* **Assumptions**:
  - Snowflake data sources will remain stable and accessible
  - CRM custom entities and fields will be available for enhanced operations
  - Azure infrastructure will support increased processing requirements
  - Business stakeholders will provide timely validation of conversion logic

* **Dependencies**:
  - Successful completion of current pipeline stabilization
  - Availability of NSAP to EBS conversion specifications
  - CRM system readiness for enhanced data loads
  - Azure Service Bus and monitoring infrastructure deployment

* **Future Considerations**:
  - Expansion to additional Ecolab divisions and regions
  - Integration with real-time SAP systems for immediate data synchronization
  - AI/ML capabilities for automated data quality improvement
  - Advanced analytics for customer insights and predictive modeling

---

## Accenture Metadata

**Status**: proposed

**Date**: 2024-12-19

**Accenture Practice**: Cloud | Data & Analytics

**Client Engagement Manager**: David Blaszyk

**Delivery Lead**: David Blaszyk

**Solution Architect**: David Blaszyk

**Technical Architect**: David Blaszyk

**Project Manager**: David Blaszyk

**Decision Makers**:
* David Blaszyk, Solution Architect
* Ecolab Business Stakeholders, Business Owners

**Consulted**:
* Ecolab Data Engineering Team, Technical Experts
* Ecolab Business Analysts, Domain Experts

**Informed**:
* Ecolab Operations Team, System Administrators
* Ecolab Development Team, Implementation Resources

**Supersedes**: N/A

**Superseded by**: N/A

---

*Accenture ADR Template v1.0 | Based on MADR 4.0.0 | Accenture Confidential*