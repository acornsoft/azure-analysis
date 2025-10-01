# ADR 002: Azure Service Bus Integration Patterns for Azure Functions

**Partner:** Acornsoft
**Client:** Ecolab
**Engagement:** Ecolab CRM Azure Functions Modernization
**Confidentiality:** Acornsoft Confidential

## Executive Summary

This Architecture Decision Record (ADR) establishes the Service Bus integration patterns for Ecolab's Azure Functions implementation, addressing the critical challenge of reliable message processing between Dynamics 365 CRM and the Customer Data Management (CDM) system. The decision focuses on implementing robust error handling, dead letter queue management, and connection string separation for queue-based and topic-based messaging patterns.

The current implementation uses separate Azure Service Bus connections for outbound queue processing (Digital Enablement) and inbound topic subscriptions (Change Feed Analysis), with comprehensive error handling and retry mechanisms. This approach ensures reliable message delivery, prevents message loss, and provides clear operational visibility into integration health.

## Context and Problem Statement

Ecolab's Azure Functions require reliable Service Bus integration for two distinct messaging patterns:

1. **Queue-based Processing**: Outbound customer data synchronization from Dynamics 365 to CDM system
2. **Topic-based Processing**: Inbound real-time change events from CDM system to Dynamics 365

The Azure Integration Specialist needs to understand the Service Bus patterns to ensure reliable message processing, proper error handling, and effective monitoring of integration health.

### Business Context

Ecolab depends on reliable data synchronization between Dynamics 365 and the CDM system. Queue-based processing ensures outbound customer data changes are delivered reliably, while topic-based processing handles real-time change events from multiple data sources. Business operations require both patterns to work independently with minimal message loss and clear error visibility.

### Technical Context

The Azure Functions use Azure Service Bus with separate connections for queue and topic messaging. The implementation includes comprehensive error handling, retry logic, and dead letter queue management to ensure message reliability.

## Decision Outcome

**Chosen option:** **"Separate Service Bus Connections with Comprehensive Error Handling"**, because this approach provides the best balance of reliability, maintainability, and operational visibility for both queue and topic-based messaging patterns.

### Rationale

Separate Service Bus connections prevent cross-contamination between outbound and inbound messaging patterns while providing independent scaling and monitoring capabilities. Comprehensive error handling with dead letter queues ensures no messages are lost, and detailed logging provides operational visibility into integration health.

## Technical Architecture

### Service Bus Configuration

The Azure Functions use separate Service Bus connections configured through environment variables:

```json
{
    "ServiceBusConnectionForQueue": "Endpoint=sb://qa-ecolabcdm.servicebus.windows.net/...",
    "ServiceBusConnectionForTopic": "Endpoint=sb://cds-cdm-servicebus-001-i.servicebus.windows.net/...",
    "QUEUE_NAME": "cdmoutboundqueue",
    "TOPIC_NAME": "cdm-chg-denormalized-int",
    "SUBSCRIPTION_NAME": "NalcoCRM"
}
```

### Queue-based Processing (Digital Enablement)

#### CDMIntegrationFunction.cs Implementation

```csharp
[FunctionName("CDMIntegrationFunction")]
public static void Run(
    [ServiceBusTrigger("cdmoutboundqueue", AccessRights.Manage, Connection = "ServiceBusConnectionForQueue")]
    string myQueueItem,
    TraceWriter log)
{
    try
    {
        // Extract configuration from environment variables
        var WEBAPI_URL = System.Environment.GetEnvironmentVariable("WEBAPI_URL");
        var CRM_URL = System.Environment.GetEnvironmentVariable("CRM_URL");
        var CRM_SERVICEUSERNAME = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERNAME");
        var CRM_SERVICEUSERPWD = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERPWD");
        var API_KEY = System.Environment.GetEnvironmentVariable("API_KEY");

        log.LogInformation($"C# ServiceBus queue trigger function processed message: {myQueueItem}");

        // Process the queue message
        ProcessQueue processQueue = new ProcessQueue();
        var result = processQueue.Process(
            myQueueItem,
            CRM_URL,
            CRM_SERVICEUSERNAME,
            CRM_SERVICEUSERPWD,
            API_KEY,
            client_id,
            client_secret,
            WEBAPI_URL,
            SourceSystemCode,
            DomainNames,
            RedirectUrl,
            Role_CODE,
            log);

        log.LogInformation($"Queue processing completed successfully: {result}");
    }
    catch (Exception ex)
    {
        log.LogError(ex, $"Error processing queue message: {ex.Message}");
        throw; // Re-throw to trigger dead letter queue
    }
}
```

### Topic-based Processing (Change Feed Analysis)

#### ReadSubscriptionMessage.cs Implementation

```csharp
[FunctionName("ReadSubscriptionMessage")]
public static void Run(
    [ServiceBusTrigger("%TOPIC_NAME%", "%SUBSCRIPTION_NAME%", AccessRights.Manage, Connection = "ServiceBusConnectionForTopic")]
    string mySbMsg,
    TraceWriter log)
{
    try
    {
        log.LogInformation($"C# ServiceBus topic trigger function processed message: {mySbMsg}");

        // Extract CRM configuration
        var CRM_URL = System.Environment.GetEnvironmentVariable("CRM_URL");
        var CRM_SERVICEUSERNAME = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERNAME");
        var CRM_SERVICEUSERPWD = System.Environment.GetEnvironmentVariable("CRM_SERVICEUSERPWD");
        var Role_CODE = System.Environment.GetEnvironmentVariable("Role_ECBYR");

        // Process the topic message
        ProcessSubscriptionMessage processSubscription = new ProcessSubscriptionMessage();
        var result = processSubscription.ProcessForTopic(
            mySbMsg,
            CRM_URL,
            CRM_SERVICEUSERNAME,
            CRM_SERVICEUSERPWD,
            Role_CODE,
            log);

        log.LogInformation($"Topic processing completed: {result}");
    }
    catch (Exception ex)
    {
        log.LogError(ex, $"Error processing topic message: {ex.Message}");
        throw; // Re-throw to trigger dead letter queue
    }
}
```

### Error Handling and Retry Logic

#### Dead Letter Queue Management

The Azure Functions implement comprehensive error handling with automatic dead letter queue routing:

```csharp
// Example error handling pattern from ProcessQueue.cs
public string Process(string message, /* parameters */, TraceWriter log)
{
    try
    {
        // Business logic processing
        var result = RegisterUser(message, /* parameters */);
        return result;
    }
    catch (HttpRequestException ex)
    {
        log.LogError(ex, "HTTP request failed for user registration");
        throw new Exception($"CDM API Error: {ex.Message}", ex);
    }
    catch (Exception ex)
    {
        log.LogError(ex, "Unexpected error in queue processing");
        throw;
    }
}
```

#### Retry Configuration

Service Bus triggers include built-in retry mechanisms:

```json
{
    "extensions": {
        "serviceBus": {
            "messageHandlerOptions": {
                "maxConcurrentCalls": 1,
                "maxAutoRenewDuration": "00:05:00"
            },
            "sessionHandlerOptions": {
                "maxConcurrentSessions": 1
            }
        }
    }
}
```

### Monitoring and Logging

#### Application Insights Integration

Comprehensive logging provides operational visibility:

```csharp
// Structured logging pattern
log.LogInformation("Processing {MessageType} for {EntityType}: {EntityId}",
    messageType, entityType, entityId);

log.LogError(ex, "Failed to process {Operation} for {EntityId}: {ErrorMessage}",
    operation, entityId, ex.Message);
```

#### Key Metrics to Monitor

- **Message Processing Rate**: Messages processed per minute
- **Error Rate**: Percentage of messages failing processing
- **Dead Letter Queue Depth**: Messages requiring manual intervention
- **Processing Latency**: Time from message receipt to completion

## Pros and Cons of the Options

### Separate Service Bus Connections

Current recommended approach with dedicated connections for each messaging pattern.

* **Business Benefits**: Independent scaling and monitoring of integration patterns
* **Technical Advantages**: Better isolation, simplified troubleshooting, flexible scaling
* **Good, because**: Prevents cross-contamination between outbound and inbound flows
* **Business Risks**: Higher configuration complexity
* **Technical Challenges**: Managing multiple connection strings and monitoring dashboards
* **Bad, because**: Increased operational overhead for connection management

### Single Service Bus Connection

Use one connection string for both queue and topic messaging.

* **Business Benefits**: Simplified configuration and management
* **Technical Advantages**: Single connection to monitor, reduced configuration complexity
* **Good, because**: Easier setup and maintenance
* **Business Risks**: Potential cross-contamination between patterns
* **Technical Challenges**: Harder to scale patterns independently, shared monitoring
* **Bad, because**: Reduced isolation between fundamentally different messaging patterns

## Consequences

### Positive Consequences

* **Business Impact**: Reliable message delivery with clear error visibility
* **Technical Impact**: Better maintainability and troubleshooting capabilities
* **Operational Impact**: Independent monitoring and scaling of integration patterns

### Negative Consequences

* **Business Impact**: Higher initial configuration complexity
* **Technical Impact**: Multiple connection strings to manage
* **Operational Impact**: Separate monitoring dashboards for each pattern

## Implementation Guidance

### Adding New Service Bus Triggers

#### For Queue Processing

```csharp
[FunctionName("NewQueueFunction")]
public static void Run(
    [ServiceBusTrigger("new-queue-name", AccessRights.Manage, Connection = "ServiceBusConnectionForQueue")]
    string message,
    TraceWriter log)
{
    // Implementation following established patterns
}
```

#### For Topic Processing

```csharp
[FunctionName("NewTopicFunction")]
public static void Run(
    [ServiceBusTrigger("topic-name", "subscription-name", AccessRights.Manage, Connection = "ServiceBusConnectionForTopic")]
    string message,
    TraceWriter log)
{
    // Implementation following established patterns
}
```

### Error Handling Best Practices

```csharp
try
{
    // Business logic
    var result = ProcessMessage(message);
    log.LogInformation("Successfully processed message: {MessageId}", messageId);
}
catch (ValidationException ex)
{
    log.LogWarning(ex, "Message validation failed: {Error}", ex.Message);
    throw; // Will go to dead letter queue
}
catch (Exception ex)
{
    log.LogError(ex, "Unexpected error processing message: {Error}", ex.Message);
    throw; // Will go to dead letter queue
}
```

### Monitoring Setup

#### Application Insights Queries

```kql
// Message processing success rate
requests
| where operation_Name contains "ServiceBus"
| summarize SuccessCount = countif(success == true),
           TotalCount = count()
           by bin(timestamp, 1h)
| project timestamp, SuccessRate = SuccessCount * 1.0 / TotalCount

// Dead letter queue monitoring
traces
| where message contains "dead letter"
| summarize count() by bin(timestamp, 1h)
```

## Testing Strategy

### Unit Testing

```csharp
[TestMethod]
public void ProcessQueue_ValidMessage_ReturnsSuccess()
{
    // Arrange
    var processQueue = new ProcessQueue();
    var message = "{\"action\":\"register\",\"userId\":\"123\"}";

    // Act
    var result = processQueue.Process(message, /* parameters */);

    // Assert
    Assert.IsTrue(result.Contains("success"));
}
```

### Integration Testing

```csharp
[TestMethod]
public async Task ServiceBusQueueTrigger_ProcessesMessage()
{
    // Send message to queue
    await queueClient.SendAsync(message);

    // Wait for processing
    await Task.Delay(5000);

    // Verify results in CRM or external system
    var userExists = await VerifyUserExists(userId);
    Assert.IsTrue(userExists);
}
```

## Success Metrics

### Technical Metrics

* **Message Delivery Rate**: 99.9% successful message processing
* **Error Rate**: <1% messages requiring dead letter queue intervention
* **Processing Latency**: <30 seconds average message processing time
* **Dead Letter Queue**: <0.1% of total messages

### Operational Metrics

* **Mean Time to Resolution**: <2 hours for dead letter queue messages
* **Monitoring Coverage**: 100% of Service Bus operations logged
* **Test Coverage**: 95%+ unit test coverage for message processing logic

## More Information

### Key Files to Understand

- `CDMIntegrationFunction.cs` - Queue trigger implementation
- `ReadSubscriptionMessage.cs` - Topic trigger implementation
- `ProcessQueue.cs` - Queue processing business logic
- `ProcessSubscriptionMessage.cs` - Topic processing business logic

### Related Patterns

- **Circuit Breaker**: Implement for external API calls
- **Saga Pattern**: Consider for multi-step business processes
- **Event Sourcing**: For complex state management scenarios

* **Related Documents**: Azure Service Bus documentation, Azure Functions triggers guide
* **Assumptions**: Service Bus standard tier provides sufficient throughput, dead letter queues are monitored regularly
* **Dependencies**: Azure Service Bus SDK, Azure Functions runtime, Application Insights
* **Future Considerations**: Evaluate Azure Service Bus premium tier if message volumes exceed current limits

---

## Acornsoft Metadata

**Status**: proposed

**Date**: 2025-10-01

**Acornsoft Practice**: Integration Architecture

**Client Engagement Manager**: {TBD}

**Delivery Lead**: {TBD}

**Solution Architect**: {TBD}

**Technical Architect**: {TBD}

**Project Manager**: {TBD}

**Decision Makers**:
* Ecolab IT Architecture Team
* Acornsoft Cloud Practice Lead

**Consulted**:
* Azure Integration Specialists - Subject Matter Experts
* Service Bus Architects - Technical Experts

**Informed**:
* Operations Team - Monitoring requirements
* Development Team - Implementation patterns

**Supersedes**: N/A

**Superseded by**: N/A

---

*Acornsoft ADR Template v1.0 | Based on MADR 4.0.0 | Acornsoft Confidential*