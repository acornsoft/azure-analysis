# ADR 001: D365-PZMigration-D Pipeline Analysis for One Customer

**Partner:** Accenture
**Client:** Ecolab
**Engagement:** D365-PZMigration-D Pipeline Analysis for One Customer
**Confidentiality:** Accenture Confidential

## Executive Summary

This ADR documents the current state analysis of the D365-PZMigration-D Azure Data Factory (ADF) pipeline, which serves as the reference implementation for Ecolab's One Customer program. The pipeline currently supports comprehensive SAP data migration to Dynamics 365 CRM for Food & Beverage (FB) and Textile Care (TC) divisions, implementing a three-tier ETL architecture with staging layer processing. While the pipeline demonstrates proven ETL capabilities with SAP integration and CRM connectivity, it serves as the architectural foundation for enhanced One Customer implementations requiring NSAP to EBS conversion and real-time processing capabilities.

## Context and Problem Statement

The D365-PZMigration-D pipeline is a comprehensive ETL solution that migrates SAP customer account data from various SAP instances (ECC, MDM, SAM) through MAP 2.0 export CSV files to Dynamics 365 CRM, ensuring data integrity and operational efficiency for Ecolab's Food & Beverage and Textile Care divisions.

### Business Context

Ecolab's One Customer program requires unified customer data management across all business divisions. The D365-PZMigration-D pipeline provides the proven architectural patterns and implementation approach that serve as the reference for enhanced One Customer capabilities in production environments.

### Current State Technical Context

The existing pipeline operates with:
- **Three-Tier ETL Architecture**: SAP source systems, staging layer processing, and CRM target integration
- **Multi-Division Support**: Dedicated pipelines and data flows for FB and TC divisions
- **Staging Layer Processing**: Intermediate CSV file storage in Azure Data Lake Storage
- **CRM Integration**: Upsert operations with batch processing and error handling
- **Reference Data Management**: CRM entity lookups for validation and enrichment

### Future State Technical Context

The enhanced pipeline implementations must support:
- **NSAP to EBS Conversion**: Account type conversions for unified customer management
- **Real-Time Processing**: Event-driven processing with Service Bus integration
- **Enhanced Monitoring**: Comprehensive logging, alerting, and dashboard capabilities
- **Multi-Division Extension**: Support for additional Ecolab divisions beyond FB and TC

### Problem Statement

While the D365-PZMigration-D pipeline provides a solid architectural foundation with proven SAP integration and CRM connectivity patterns, it serves as the reference implementation that highlights the need for enhanced One Customer capabilities in production environments:
- Lack of NSAP to EBS account conversion capabilities
- Limited real-time processing and event-driven architecture
- Basic monitoring and operational visibility
- Division-specific implementations requiring consolidation

## Decision Drivers

### Business Requirements
- **Unified Customer Management**: Support for One Customer program across all divisions
- **Data Integrity**: Ensure accurate SAP to CRM data migration with validation
- **Operational Efficiency**: Automated processing with comprehensive error handling
- **Scalability**: Support for growing data volumes and additional business divisions

### Technical Requirements
- **SAP Integration**: Robust connectivity with ECC, MDM, SAM, and AZ systems
- **CRM Integration**: Reliable Dynamics 365 connectivity with upsert operations
- **Data Quality**: Reference data validation and business rule implementation
- **Performance**: Efficient processing of large datasets with staging layer optimization

### Constraints and Assumptions
- **Infrastructure**: Azure Data Factory, Data Lake Storage, and Key Vault availability
- **Data Sources**: SAP systems providing CSV exports via MAP 2.0
- **CRM Readiness**: Dynamics 365 custom entities and fields availability
- **Business Rules**: Established account type mappings and validation logic

## Current State Analysis

### Pipeline Architecture Deep Dive

The D365-PZMigration-D pipeline represents a proven, production-ready ETL solution with the following detailed architecture:

#### Pipeline Inventory (4 Active Pipelines)
**Food & Beverage Division:**
- `Staging_to_CRM_load_FB.json`: Core pipeline for loading staged FB account data to Dynamics 365 CRM
- `Weekly Account Load FB.json`: Handles weekly incremental FB account loads with data flow integration

**Textile Care Division:**
- `Staging_to_CRM_load_TC.json`: Pipeline for loading staged TC account data to Dynamics 365 CRM
- `US Weekly Account Load TC.json`: Weekly incremental loads for US TC accounts

#### Data Flow Complexity Analysis (6 Data Flows)

**Food & Beverage Data Flows:**
- `FB Customer Account Load.json`: Complex customer account processing with 13+ sources
- `FB Org Account Load.json`: Organizational account hierarchy management
- `US FB Customer Account Load.json`: US-specific FB customer processing
- `US FB Org Account Load.json`: US FB organizational accounts

**Textile Care Data Flows:**
- `TC Customer Account Load.json`: TC region customer processing
- `TC Org Account Load.json`: TC organizational account management

#### Dataset Architecture (18 Datasets)

**SAP Source Datasets:**
- `ECC.json`: SAP ECC system customer data
- `MDM.json`: SAP MDM master data
- `SAMAlignment.json`: SAM system alignment data
- `DimCAM.json`: Customer account management dimensions
- `CustSalesAttr.json`: Customer sales attributes

**CRM Reference Datasets:**
- `NWAccounts.json`: Dynamics 365 CRM accounts entity
- `NWSystemUser.json`: CRM system users for ownership
- `NWERPSystem.json`: ERP system reference data
- `NWCountry.json`: Country reference data
- `NWStateProvince.json`: State/province reference data
- `NWSBU.json`: Strategic Business Unit data
- `NWDistrict.json`: District reference data
- `NWDistrictSalesOrg.json`: District sales organization relationships
- `NWCurrency.json`: Currency reference data
- `NWSINC.json`: SINC (business segment) data

**Staging Datasets:**
- `StagingSink_Accounts.json`: Primary staging for account data
- `StagingSink_L1Accounts.json`: Level 1 account processing staging
- `StagingSink_L2Accounts.json`: Level 2 account processing staging

#### Integration Patterns

**SAP Data Integration:**
- CSV file ingestion from Azure Data Lake Storage
- MAP 2.0 export processing with structured file naming
- Multi-source data consolidation (ECC, MDM, SAM, AZ systems)
- Incremental processing with weekly load patterns

**CRM Integration:**
- Environment: Production Dynamics 365 CRM instance
- Authentication: Office 365 service account integration
- Operations: Upsert with batch size of 10 records
- Error Handling: Comprehensive logging with error file generation

**Storage Integration:**
- Primary storage: Azure Data Lake Storage Gen2
- Staging patterns: Division-specific folder structures
- File organization: Date-based partitioning (yyyy/MM/dd)
- Error logging: Dedicated error folders for troubleshooting

#### Processing Patterns

**Batch Processing:**
- Weekly scheduled execution via triggers
- Memory-optimized compute configurations
- Sequential processing with dependency management
- Division-specific pipeline execution

**Data Quality Patterns:**
- CRM reference data lookups for validation
- Business rule implementation through data flow expressions
- Multi-level staging (L1, L2) for complex transformations
- Error tolerance with incompatible row skipping

**Monitoring Patterns:**
- Basic pipeline execution logging
- Success/failure file tracking
- Error file generation for troubleshooting
- Manual monitoring and intervention

### Current State Capabilities Assessment

#### Strengths
- **Proven Architecture**: Production-tested ETL patterns serving as reference implementation
- **Multi-Division Support**: Dedicated pipelines for FB and TC divisions
- **SAP Integration**: Robust connectivity with multiple SAP systems
- **Staging Layer**: Intermediate processing enabling complex transformations
- **CRM Integration**: Reliable upsert operations with error handling

#### Limitations
- **Division-Specific**: Separate pipelines requiring consolidation for enterprise view
- **Batch-Only Processing**: No real-time or event-driven capabilities
- **Limited Monitoring**: Basic logging without comprehensive alerting
- **No NSAP-EBS Conversion**: Lacks account type conversion logic
- **Manual Operations**: Requires manual intervention for complex scenarios

### One Customer Reference Patterns

#### Architectural Foundation
The PZMigration pipeline provides proven patterns for:
1. **SAP Data Ingestion**: CSV file processing from MAP 2.0 exports
2. **Staging Layer Design**: Multi-level intermediate processing
3. **CRM Integration**: Upsert operations with batch processing
4. **Error Handling**: Comprehensive logging and error file generation
5. **Reference Data Management**: CRM lookups for validation and enrichment

#### Implementation Best Practices
- **Data Flow Complexity**: 13+ source datasets with complex joins
- **Batch Size Optimization**: 10-record batches for CRM performance
- **File Organization**: Date-based partitioning for operational efficiency
- **Error Recovery**: Detailed error logging for troubleshooting

## Technical Architecture

### Current State Architecture

The existing D365-PZMigration-D pipeline implements a proven three-tier ETL architecture:

**Source Layer:**
- SAP systems (ECC, MDM, SAM, AZ) via MAP 2.0 CSV exports
- Azure Data Lake Storage for file staging
- Dynamics 365 CRM for reference data

**Transformation Layer:**
- ADF data flows with complex joins and lookups
- Multi-level staging processing (L1, L2 accounts)
- Business rule implementation and data validation
- Reference data enrichment from CRM

**Target Layer:**
- Dynamics 365 CRM accounts entity
- Azure Data Lake Storage for error logging
- Success/failure tracking datasets

**Supporting Infrastructure:**
- Azure Data Lake Storage for staging
- Azure Key Vault for credential management
- Weekly scheduled triggers

### Data Flow Patterns

**Customer Account Processing:**
1. Extract from multiple SAP sources (ECC, MDM, SAM)
2. Join with CRM reference data (users, countries, ERP systems)
3. Apply business rules and transformations
4. Multi-level staging for complex account hierarchies
5. Load to CRM accounts with upsert operations

**Organizational Account Processing:**
1. Extract organizational data from SAP sources
2. Process hierarchical relationships
3. Validate against CRM reference data
4. Apply organizational business rules
5. Load to CRM with relationship preservation

### Integration Points

**SAP Integration:**
- CSV file processing from Azure Data Lake Storage
- MAP 2.0 export format handling
- Multi-system data consolidation

**CRM Integration:**
- FetchXML queries for reference data retrieval
- Upsert operations for data synchronization
- Batch processing with error handling

**Monitoring and Logging:**
- Pipeline execution logging
- Error file generation
- Success/failure tracking

## Decision Outcome

**Chosen Option: Reference Implementation Analysis Complete**

The D365-PZMigration-D pipeline serves as the architectural foundation and proven patterns for One Customer implementations. This ADR documents the current state capabilities, limitations, and patterns that inform the design and implementation of enhanced production pipelines.

### Key Findings

1. **Architectural Foundation**: Provides proven three-tier ETL patterns with staging layer processing
2. **SAP Integration Excellence**: Robust connectivity with multiple SAP systems via MAP 2.0
3. **CRM Integration Patterns**: Reliable upsert operations with comprehensive error handling
4. **Division-Specific Design**: Separate pipelines for FB and TC requiring consolidation
5. **Reference Implementation**: Serves as the blueprint for enhanced One Customer capabilities

### Implementation Guidance

The patterns and capabilities documented in this ADR should be leveraged for:
- **Production Pipeline Design**: Use PZMigration patterns as foundation for D365-Snowflake-D enhancements
- **NSAP to EBS Conversion**: Build upon existing staging and transformation logic
- **Monitoring Enhancement**: Extend basic logging to comprehensive alerting
- **Multi-Division Consolidation**: Consolidate division-specific pipelines into unified architecture

## Pros and Cons of the Options

### Option 1: Maintain as Reference Implementation

* **Business Benefits**: Preserve proven architectural patterns, low maintenance overhead
* **Technical Advantages**: Continue serving as design reference, maintain operational stability
* **Good, because**: Provides stable foundation for other implementations
* **Business Risks**: Limits ability to enhance with One Customer capabilities
* **Technical Challenges**: Increasing maintenance burden, potential technical debt
* **Bad, because**: Prevents leveraging improvements from enhanced implementations

### Option 2: Incremental Enhancement

* **Business Benefits**: Gradual improvement while maintaining reference patterns
* **Technical Advantages**: Lower risk enhancement of existing capabilities
* **Good, because**: Allows testing of new features while preserving reference implementation
* **Business Risks**: Extended timeline for full One Customer alignment
* **Technical Challenges**: Complex coordination between reference and enhanced implementations
* **Bad, because**: Delays realization of unified One Customer benefits

### Option 3: Consolidation into Unified Architecture

* **Business Benefits**: Single enterprise pipeline supporting all divisions and One Customer requirements
* **Technical Advantages**: Modern unified architecture, comprehensive monitoring, scalable design
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

### Phase 1: Reference Pattern Documentation (Completed)
- Complete detailed analysis of PZMigration pipeline capabilities
- Document architectural patterns and best practices
- Establish implementation guidance for enhanced pipelines
- Create comprehensive current state documentation

### Phase 2: Pattern Migration to Production (Weeks 1-4)
- Migrate proven PZMigration patterns to D365-Snowflake-D pipeline
- Implement enhanced staging layer processing
- Establish division-specific pipeline consolidation
- Validate pattern migration with production data

### Phase 3: One Customer Enhancement Integration (Weeks 5-8)
- Implement NSAP to EBS conversion using PZMigration staging patterns
- Add real-time processing capabilities
- Enhance monitoring and alerting
- Integrate Service Bus for event-driven processing

### Phase 4: Multi-Division Extension (Weeks 9-12)
- Extend unified architecture to support additional Ecolab divisions
- Implement advanced scalability and performance optimizations
- Conduct end-to-end integration testing across all supported entities
- Perform user acceptance testing with business stakeholders

### Phase 5: Production Deployment and Optimization (Weeks 13-16)
- Execute phased deployment to production environment
- Implement comprehensive monitoring and support procedures
- Conduct post-deployment validation and performance monitoring
- Provide operational training to support teams

## Risk Assessment

### High-Risk Items

* **Pattern Migration Complexity**: Ensuring successful migration of proven patterns to enhanced pipelines
  * **Impact**: High - Could affect One Customer implementation timeline
  * **Probability**: Medium
  * **Mitigation**: Comprehensive pattern documentation, phased migration approach, extensive testing

* **Division Consolidation Challenges**: Merging division-specific pipelines into unified architecture
  * **Impact**: Medium - Could impact operational continuity
  * **Probability**: Medium
  * **Mitigation**: Detailed consolidation planning, business validation, phased rollout

* **Staging Layer Compatibility**: Ensuring enhanced staging patterns work with existing data flows
  * **Impact**: High - Could affect data processing reliability
  * **Probability**: Low
  * **Mitigation**: Compatibility testing, gradual pattern adoption, rollback capabilities

## Stakeholder Impact

### Impacted Stakeholders

* **Business Stakeholders**: Enhanced One Customer capabilities through proven patterns
* **Technical Teams**: Architectural foundation and implementation guidance
* **Operations Teams**: Reference implementation for operational procedures
* **End Users**: Improved data quality through validated patterns
* **Data Analysts**: Established patterns for data processing and analysis

### Communication Plan

* **Pattern Documentation**: Comprehensive documentation of architectural patterns
* **Implementation Guidance**: Clear guidance for applying patterns to enhanced pipelines
* **Technical Review Sessions**: Architecture and pattern review with technical teams
* **Business Validation Sessions**: Pattern validation with business stakeholders
* **Training Sessions**: Pattern implementation training for development teams

## Testing Strategy

### Testing Approach

* **Pattern Validation**: Testing of migrated patterns in enhanced pipelines
* **Integration Testing**: End-to-end testing of consolidated architectures
* **User Acceptance Testing**: Business validation of enhanced capabilities
* **Performance Testing**: Load testing with production-scale data volumes
* **Regression Testing**: Validation of existing functionality after enhancements

### Success Criteria

* **Pattern Migration**: 100% successful migration of proven patterns
* **Data Accuracy**: 100% match between source and target systems
* **Performance**: Meet or exceed current SLA requirements
* **Reliability**: >99.9% successful execution rate

## Success Metrics

### Technical Metrics

* **Pattern Adoption**: 100% successful migration of PZMigration patterns to enhanced pipelines
* **Architecture Consolidation**: Successful unification of division-specific pipelines
* **Performance Maintenance**: Maintain or improve current processing times
* **Reliability**: >99.9% successful execution rate with comprehensive error recovery

### Operational Metrics

* **Implementation Efficiency**: Reduced development time through pattern reuse
* **Operational Continuity**: Seamless transition from reference to enhanced implementations
* **Support Effectiveness**: Improved troubleshooting through documented patterns
* **Knowledge Transfer**: Successful adoption of patterns across development teams

## More Information

* **Related Documents**:
  - ADR-001-ADR--D365-Snowflake-D-Pipeline-Analysis-Accenture-Ecolab.md (Target pipeline enhancement analysis)
  - d365-pzmigration-analysis.md (Detailed PZMigration pipeline analysis)
  - d365-shipto-to-soldto-requirement.md (NSAP to EBS conversion requirements)

* **Assumptions**:
  - PZMigration patterns remain valid and applicable to enhanced implementations
  - SAP data sources and MAP 2.0 exports maintain current format and availability
  - CRM entities and reference data structures remain stable
  - Business rules and validation logic can be migrated to enhanced pipelines

* **Dependencies**:
  - Successful completion of PZMigration pattern documentation
  - Availability of enhanced pipeline environments for pattern migration
  - Business validation of pattern applicability to One Customer requirements

* **Future Considerations**:
  - Evolution of architectural patterns based on new requirements
  - Integration with real-time SAP systems for immediate data synchronization
  - Enhancement of staging layer capabilities for complex transformations
  - Expansion to additional Ecolab divisions and regions

---

## Accenture Metadata

**Status**: accepted

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

## Accenture Metadata

**Status**: {proposed | accepted | rejected | deprecated | superseded}

**Date**: {YYYY-MM-DD}

**Accenture Practice**: {Cloud | Data & Analytics | Security | Infrastructure | Applications}

**Client Engagement Manager**: {Name}

**Delivery Lead**: {Name}

**Solution Architect**: {Name}

**Technical Architect**: {Name}

**Project Manager**: {Name}

**Decision Makers**:
* {Name, Role}
* {Name, Role}

**Consulted**:
* {Name, Role - Subject Matter Expert}
* {Name, Role - Stakeholder}

**Informed**:
* {Name, Role - Team Member}
* {Name, Role - Stakeholder}

**Supersedes**: {ADR-XXXX if applicable}

**Superseded by**: {ADR-XXXX if applicable}

---

*Accenture ADR Template v1.0 | Based on MADR 4.0.0 | Accenture Confidential*
