# ADR 001: Azure Functions Change Feed and Digital Enablement Pattern Analysis

**Partner:** Acornsoft
**Client:** Ecolab
**Engagement:** Ecolab CRM Azure Functions Modernization
**Confidentiality:** Acornsoft Confidential

## Executive Summary

This Architecture Decision Record (ADR) establishes the foundational architectural patterns for Ecolab's Customer Data Management (CDM) integration ecosystem, focusing on the critical separation between Digital Enablement and Change Feed Analysis patterns within the Azure Functions codebase. The decision addresses the complex challenge of maintaining reliable, scalable data synchronization between Dynamics 365 CRM and external digital tools while processing real-time change events from multiple data sources through Azure Service Bus messaging.

The current implementation maintains separate Azure Functions for two distinct integration patterns operating within the same project: Digital Enablement handles outbound customer data synchronization from Dynamics 365 to external digital tools via queue-based processing, while Change Feed Analysis manages inbound real-time change events from the CDM system to CRM through topic-based subscriptions. This architectural separation ensures maintainability for Azure Integration Specialists, supports independent scaling requirements, and provides distinct error handling strategies for each pattern. The solution enables efficient codebase modifications while reducing cross-contamination risks between the outbound and inbound integration flows.

## Context and Problem Statement

Ecolab's Customer Data Management (CDM) system requires clear architectural separation between two distinct integration patterns that currently coexist in the same Azure Functions project:

1. **Digital Enablement**: Outbound processing of customer data changes from Dynamics 365 to external digital tools
2. **Change Feed Analysis**: Inbound processing of real-time change events from various data sources via Azure Service Bus topics

An Azure Integration Specialist needs to understand these patterns to maintain and extend the Azure Functions codebase effectively without introducing cross-contamination between the patterns.

### Business Context

Ecolab requires reliable synchronization of customer data between Dynamics 365 and external digital tools, while also needing to process real-time change events from various data sources. The business depends on both patterns working independently to support different operational needs - Digital Enablement for proactive customer engagement and Change Feed for reactive data processing.

### Technical Context

The current codebase contains Azure Functions with Service Bus triggers using both queue-based (cdmoutboundqueue) and topic-based (cdm-chg-denormalized-int with subscriptions) messaging patterns. The functions are written in C# .NET using Microsoft.Xrm.Sdk for CRM integration and Azure Service Bus for messaging.

### Configuration Context

The Azure Functions are configured through `local.settings.json` with the following key settings (sensitive values excluded):

```json
{
    "Values": {
        "API_KEY": "B82D881D7049410FBB9188F36B358250",
        "APPINSIGHTS_INSTRUMENTATIONKEY": "cd7647d8-f203-4e58-b103-f81c814d1da3",
        "AzureWebJobsStorage": "UseDevelopmentStorage=true",
        "ACCOUNT_ALIGNMENT_SUBSCRIPTION_NAME": "IndCRMAcctAlignment",
        "client_id": "ea65f8da618a4c25bdc830b0528ca191",
        "CRM_SERVICEUSERNAME": "CRM.Online@ecolab.com",
        "CRM_URL": "https://ecolabdev.api.crm.dynamics.com/XRMServices/2011/Organization.svc",
        "DOMAINLIST": "ecolab.com, nalco.com",
        "NW_ACCOUNT_ALIGNMENT_SUBSCRIPTION_NAME": "IndCRMAcctAlignment",
        "QUEUE_NAME": "cdmoutboundqueue",
        "RedirectUrl": "https://ecolabdev.crm.dynamics.com/main.aspx",
        "Role_ECBYR": 27,
        "ServiceBusConnectionForTopic": "Endpoint=sb://cds-cdm-servicebus-001-i.servicebus.windows.net/...",
        "ServiceBusConnectionForQueue": "Endpoint=sb://qa-ecolabcdm.servicebus.windows.net/...",
        "SourceSystemCode": "NLCCRM",
        "SUBSCRIPTION_NAME": "NalcoCRM",
        "TOPIC_NAME": "cdm-chg-denormalized-int",
        "USER_ALIGNMENT_SUBSCRIPTION_NAME": "IndCRMUserAlignment",
        "WEBAPI_URL": "https://api-cloudhubcentral-dev.ecolab.com/user-reg-and-alignment/api/v3/"
    }
}
```

## Considered Options

* **Option 1 - Maintain Separate Azure Functions**: Keep Digital Enablement and Change Feed processing in separate functions within the same project
* **Option 2 - Single Unified Function**: Combine both patterns into a single Azure Function with conditional logic
* **Option 3 - Microservices Architecture**: Split into separate Azure Function Apps with independent deployment pipelines

## Decision Outcome

**Chosen option:** **"Option 1 - Maintain Separate Azure Functions"**, because this approach provides the best balance of maintainability, scalability, and operational efficiency while meeting the complex requirements of both Digital Enablement and Change Feed patterns.

### Rationale

The decision to maintain separate Azure Functions for Digital Enablement and Change Feed Analysis is driven by the fundamental differences in their operational patterns, scaling requirements, and error handling needs. Digital Enablement requires reliable outbound processing with guaranteed delivery, while Change Feed Analysis demands high-throughput inbound processing of real-time events. Combining these patterns would create unnecessary complexity and coupling, whereas separation allows for independent optimization, monitoring, and maintenance. This architectural choice supports the "One Customer" vision by providing a stable foundation that can evolve with changing business requirements.

## Technical Architecture

### Solution Overview

The solution maintains separate Azure Functions for two distinct integration patterns within the same project:

**Digital Enablement (Outbound)**: Queue-based processing from Dynamics 365 to external digital tools via CDM web service APIs
**Change Feed Analysis (Inbound)**: Topic-based processing of real-time change events from CDM system to Dynamics 365 CRM

### Digital Enablement Architecture

#### Key Components

**CDMIntegrationFunction.cs**
```csharp
[FunctionName("CDMIntegrationFunction")]
public static void Run([ServiceBusTrigger("cdmoutboundqueue", AccessRights.Manage, Connection = "ServiceBusConnectionForQueue")] string myQueueItem, TraceWriter log)
{
    // Environment variable extraction for configuration
    var WEBAPI_URL = System.Environment.GetEnvironmentVariable("WEBAPI_URL");
    var CRM_URL = System.Environment.GetEnvironmentVariable("CRM_URL");
    var CRM_SERVICEUSERNAME = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERNAME");
    var CRM_SERVICEUSERPWD = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERPWD");
    var API_KEY = System.Environment.GetEnvironmentVariable("API_KEY");

    // Process queue message through business logic
    ProcessQueue processQueue = new ProcessQueue();
    returnMessage = processQueue.Process(myQueueItem, CRM_URL, CRM_SERVICEUSERNAME, CRM_SERVICEUSERPWD, API_KEY, client_id, client_secret, WEBAPI_URL, SourceSystemCode, DomainNames, RedirectUrl, Role_CODE, log);
}
```

**ProcessQueue.cs**: Core business logic implementing three main operations:
- **RegisterUser()**: Creates new users in CDM system via HTTP POST to `/user-reg-and-alignment/api/v3/user/registration`
- **AlignToAccount()**: Associates users with accounts via HTTP POST to `/user-reg-and-alignment/api/v3/user/account-alignment`
- **AlignToRole()**: Assigns roles to users via HTTP POST to `/user-reg-and-alignment/api/v3/user/role-alignment`

### Change Feed Analysis Architecture

#### Key Components

**ReadSubscriptionMessage.cs**: Main topic trigger function
```csharp
[FunctionName("ReadSubscriptionMessage")]
public static void Run([ServiceBusTrigger("%TOPIC_NAME%", "%SUBSCRIPTION_NAME%", AccessRights.Manage, Connection = "ServiceBusConnectionForTopic")] string mySbMsg, TraceWriter log)
{
    ProcessSubscriptionMessage processSubscription = new ProcessSubscriptionMessage();
    returnString = processSubscription.ProcessForTopic(mySbMsg, CRM_URL, CRM_SERVICEUSERNAME, CRM_SERVICEUSERPWD, Role_CODE, log);
}
```

**ProcessSubscriptionMessage.cs**: Comprehensive business logic handling multiple CDM message types:
- **user**: User creation/update in CRM (IsExistsCDMUser, CDMUserCustomerRoleProcess)
- **user_permission**: User permission/role assignments
- **user_account**: User-to-account associations (CDMUserAccountProcess)
- **site_customer**: Site creation and management (UpsertSite)
- **account_site_customer**: Complex account-site relationships (UpsertShipToAndLinkSite)
- **customer_role**: Customer role management
- **user_customer_role**: User-to-customer role assignments

### Integration Points

- **Azure Service Bus**: Separate connections for queue (cdmoutboundqueue) and topic (cdm-chg-denormalized-int) messaging
- **Dynamics 365**: CRM data source/target using Microsoft.Xrm.Sdk with FetchXML queries and entity relationships
- **CDM Web Services**: External API integration for user registration, alignment, and account synchronization
- **Application Insights**: Comprehensive monitoring and logging
- **Azure Key Vault**: Secrets management for service credentials

## Pros and Cons of the Options

### Option 1 - Maintain Separate Azure Functions

Current recommended approach with separate functions for each integration pattern.

* **Business Benefits**: Improved development efficiency and reduced bug rates through pattern separation
* **Technical Advantages**: Better maintainability, scalability, and error isolation between integration patterns
* **Good, because**: Clear architectural boundaries prevent cross-contamination of integration logic
* **Business Risks**: Slightly higher initial development time for architectural separation
* **Technical Challenges**: Potential code duplication in shared utilities, learning curve for understanding both patterns
* **Bad, because**: Need to monitor and manage multiple function groups separately

### Option 2 - Single Unified Function

Combine both patterns into a single Azure Function with conditional logic.

* **Business Benefits**: Reduced operational complexity and lower monitoring overhead
* **Technical Advantages**: Single deployment unit, shared code base, simplified scaling
* **Good, because**: Easier management and reduced infrastructure costs
* **Business Risks**: Higher risk of cross-contamination between patterns affecting business operations
* **Technical Challenges**: Complex conditional logic, difficult to scale patterns independently, harder to maintain
* **Bad, because**: Increased coupling between fundamentally different integration patterns

### Option 3 - Microservices Architecture

Split into separate Azure Function Apps with independent deployment pipelines.

* **Business Benefits**: Maximum isolation and independent scaling capabilities
* **Technical Advantages**: Complete separation, independent deployments, granular monitoring
* **Good, because**: Ultimate flexibility for future evolution and scaling
* **Business Risks**: Higher operational complexity and infrastructure costs
* **Technical Challenges**: Increased deployment complexity, potential duplication of shared resources
* **Bad, because**: Over-engineering for current requirements, higher maintenance overhead

## Consequences

### Positive Consequences

* **Business Impact**: Improved development efficiency and reduced bug rates through pattern separation
* **Technical Impact**: Better maintainability, scalability, and error isolation between integration patterns
* **Operational Impact**: Easier monitoring, troubleshooting, and independent scaling of each pattern

### Negative Consequences

* **Business Impact**: Slightly higher initial development time for architectural separation
* **Technical Impact**: Potential code duplication in shared utilities, learning curve for understanding both patterns
* **Operational Impact**: Need to monitor and manage multiple function groups separately

### Risk Mitigation

- **Code Reviews**: Mandatory reviews for cross-pattern changes
- **Documentation**: Comprehensive ADR and code comments
- **Training**: Pattern-specific training for Azure Integration Specialists
- **Testing**: Separate test suites for each pattern

## Implementation Roadmap

### Phase 1: Foundation (Completed)
- Establish architectural patterns for Digital Enablement and Change Feed
- Implement separate Azure Functions with appropriate Service Bus triggers
- Set up monitoring and logging infrastructure

### Phase 2: Enhancement (Current)
- Optimize performance and error handling
- Implement comprehensive testing strategy
- Document operational procedures

### Phase 3: Evolution (Future)
- Evaluate Azure Functions v4 migration
- Implement advanced monitoring and alerting
- Consider direct API integrations for Digital Enablement

### Phase 4: Optimization (Future)
- Implement automated scaling based on message volumes
- Optimize data processing patterns
- Enhance security and compliance measures

## Risk Assessment

### High-Risk Items

* **Cross-Pattern Contamination**: Risk of changes in one pattern affecting the other
  * **Impact**: High - Could cause data synchronization failures
  * **Probability**: Medium
  * **Mitigation**: Strict code review processes and automated testing

* **Service Bus Performance**: High-volume message processing could overwhelm Service Bus
  * **Impact**: High - System downtime and data loss
  * **Probability**: Low
  * **Mitigation**: Implement proper throttling and dead letter queue handling

### Risk Monitoring

Risks will be monitored through Application Insights dashboards and automated alerts. Regular architecture reviews will assess the effectiveness of mitigation strategies.

## Stakeholder Impact

### Impacted Stakeholders

* **Business Stakeholders**: Minimal impact, improved system reliability and maintainability
* **Technical Teams**: Azure Integration Specialists will need training on architectural patterns
* **Operations Teams**: Separate monitoring requirements for each pattern
* **End Users**: No direct impact, improved system stability

### Communication Plan

- Technical teams: Architecture review meetings and documentation distribution
- Operations: Monitoring setup and alerting configuration sessions
- Business stakeholders: High-level summary of improvements and benefits

## Testing Strategy

### Testing Approach

* **Unit Testing**: Individual functions and processing classes with mocked dependencies
* **Integration Testing**: End-to-end message processing through Service Bus queues and topics
* **User Acceptance Testing**: Business validation of data synchronization accuracy
* **Performance Testing**: Load testing for expected message volumes per pattern

### Success Criteria

- 95%+ unit test coverage for new code
- Zero integration failures in automated tests
- <5% error rate in production message processing
- <30 second average processing time per message

## Success Metrics

### Business Metrics

* **System Uptime**: 99.9% availability for both integration patterns
* **Data Accuracy**: 99.5%+ accuracy in customer data synchronization
* **Development Velocity**: 50% reduction in bug-related rework

### Technical Metrics

* **Message Processing Time**: <30 seconds average per message
* **Error Rate**: <5% message processing failures
* **Test Coverage**: 95%+ unit test coverage

### Operational Metrics

* **Mean Time to Resolution**: <4 hours for production incidents
* **Deployment Frequency**: Weekly releases without service disruption
* **Monitoring Coverage**: 100% of functions with Application Insights

## More Information

### Implementation Guidance for Junior Integration Specialists

#### Adding New Digital Enablement Features

1. **Queue Processing**: Add new logic to `ProcessQueue.cs`
2. **HTTP Endpoints**: Follow `RegisterContactForDigitalTools.cs` pattern
3. **Configuration**: Use environment variables for service connections

#### Adding New Change Feed Subscriptions

1. **Create Trigger Function**: Copy existing topic trigger pattern
2. **Update ServiceBusTrigger**: Modify topic/subscription attributes
3. **Processing Logic**: Add cases to `ProcessSubscriptionMessage.ProcessForTopic()`

#### Common Patterns

**Environment Variables**:
```csharp
string connectionString = Environment.GetEnvironmentVariable("ServiceBusConnectionString");
```

**Logging**:
```csharp
log.LogInformation("Processing message: {MessageId}", messageId);
log.LogError(ex, "Error processing: {Error}", ex.Message);
```

#### Key Files to Understand
- `CDMIntegrationFunction.cs` - Digital Enablement entry point
- `ProcessQueue.cs` - Digital Enablement business logic
- `ReadSubscriptionMessage.cs` - Change Feed entry point
- `ProcessSubscriptionMessage.cs` - Change Feed business logic

* **Related Documents**: Azure Functions documentation, Service Bus patterns, Dynamics 365 SDK reference
* **Assumptions**: Current architectural patterns will remain stable, junior developers have basic C# knowledge
* **Dependencies**: Azure Service Bus, Dynamics 365, Application Insights, Azure Functions runtime
* **Future Considerations**: Review architecture annually or when message volumes exceed 10x current levels

---

## Acornsoft Metadata

**Status**: proposed

**Date**: 2025-10-01

**Acornsoft Practice**: Cloud Architecture

**Client Engagement Manager**: {TBD}

**Delivery Lead**: {TBD}

**Solution Architect**: {TBD}

**Technical Architect**: {TBD}

**Project Manager**: {TBD}

**Decision Makers**:
* Ecolab IT Architecture Team
* Acornsoft Cloud Practice Lead

**Consulted**:
* Junior Integration Specialists - Subject Matter Experts
* Azure Functions Developers - Technical Experts

**Informed**:
* Operations Team - Monitoring requirements
* Business Stakeholders - System reliability improvements

**Supersedes**: N/A

**Superseded by**: N/A

---

*Acornsoft ADR Template v1.0 | Based on MADR 4.0.0 | Acornsoft Confidential*