# ADR 003: Dynamics 365 CRM Integration Patterns for Azure Functions

**Partner:** Acornsoft
**Client:** Ecolab
**Engagement:** Ecolab CRM Azure Functions Modernization
**Confidentiality:** Acornsoft Confidential

## Executive Summary

This Architecture Decision Record (ADR) establishes the Dynamics 365 CRM integration patterns for Ecolab's Azure Functions implementation, focusing on reliable data operations, FetchXML query optimization, and entity relationship management. The decision addresses the critical challenge of maintaining data consistency between Dynamics 365 CRM and external systems while handling complex business logic for user management, account alignment, and role assignments.

The current implementation uses Microsoft.Xrm.Sdk for CRM operations with comprehensive error handling, transaction management, and optimized FetchXML queries. This approach ensures data integrity, prevents duplicate records, and provides clear operational visibility into CRM integration health.

## Context and Problem Statement

Ecolab's Azure Functions require robust Dynamics 365 CRM integration for:

1. **User Management**: Creating and updating user records with proper role assignments
2. **Account Alignment**: Associating users with customer accounts and sites
3. **Entity Relationships**: Managing complex relationships between users, accounts, sites, and roles

The Azure Integration Specialist needs to understand CRM integration patterns to ensure reliable data operations, proper error handling, and effective relationship management.

### Business Context

Ecolab depends on accurate customer data synchronization between Dynamics 365 and external systems. CRM integration must handle user registration, account alignment, role assignments, and site management while maintaining data consistency and preventing duplicates.

### Technical Context

The Azure Functions use Microsoft.Xrm.Sdk v8.2 with FetchXML queries for data retrieval and entity operations for data manipulation. The implementation includes comprehensive error handling and transaction management.

## Decision Outcome

**Chosen option:** **"Microsoft.Xrm.Sdk with FetchXML Queries and Transaction Management"**, because this approach provides the best balance of reliability, performance, and maintainability for CRM integration operations.

### Rationale

Microsoft.Xrm.Sdk provides native CRM operations with proper transaction support, while FetchXML offers optimized query performance. Transaction management ensures data consistency, and comprehensive error handling prevents partial updates that could corrupt data relationships.

## Technical Architecture

### CRM Connection Management

#### Service Client Configuration

```csharp
// CRM service client initialization
private static IOrganizationService GetCRMService(string crmUrl, string username, string password)
{
    var credentials = new ClientCredentials();
    credentials.UserName.UserName = username;
    credentials.UserName.Password = password;

    var serviceUrl = new Uri(crmUrl);
    var service = new OrganizationServiceProxy(serviceUrl, null, credentials, null);

    return service;
}
```

### FetchXML Query Patterns

#### User Existence Check

```csharp
private static bool IsExistsCDMUser(string email, IOrganizationService service, TraceWriter log)
{
    string fetchXml = $@"
        <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
            <entity name='contact'>
                <attribute name='contactid' />
                <attribute name='emailaddress1' />
                <filter type='and'>
                    <condition attribute='emailaddress1' operator='eq' value='{email}' />
                    <condition attribute='statecode' operator='eq' value='0' />
                </filter>
            </entity>
        </fetch>";

    var fetchExpression = new FetchExpression(fetchXml);
    var result = service.RetrieveMultiple(fetchExpression);

    return result.Entities.Count > 0;
}
```

#### Account Lookup by External ID

```csharp
private static EntityReference GetAccountByExternalId(string externalId, IOrganizationService service)
{
    string fetchXml = $@"
        <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
            <entity name='account'>
                <attribute name='accountid' />
                <attribute name='name' />
                <filter type='and'>
                    <condition attribute='ecolab_externalid' operator='eq' value='{externalId}' />
                    <condition attribute='statecode' operator='eq' value='0' />
                </filter>
            </entity>
        </fetch>";

    var result = service.RetrieveMultiple(new FetchExpression(fetchXml));
    return result.Entities.Count > 0 ? result.Entities[0].ToEntityReference() : null;
}
```

### Entity Operations

#### User Creation with Role Assignment

```csharp
private static string CDMUserCustomerRoleProcess(dynamic jsonData, IOrganizationService service, TraceWriter log)
{
    using (var transaction = new TransactionScope())
    {
        try
        {
            // Check if user exists
            bool userExists = IsExistsCDMUser(jsonData.email.ToString(), service, log);

            if (!userExists)
            {
                // Create new contact
                var contact = new Entity("contact");
                contact["firstname"] = jsonData.firstName?.ToString();
                contact["lastname"] = jsonData.lastName?.ToString();
                contact["emailaddress1"] = jsonData.email.ToString();
                contact["ecolab_externalid"] = jsonData.userId?.ToString();

                var contactId = service.Create(contact);
                log.LogInformation($"Created new contact: {contactId}");
            }

            // Assign customer role
            AssignCustomerRole(jsonData, service, log);

            transaction.Complete();
            return "User and role processed successfully";
        }
        catch (Exception ex)
        {
            log.LogError(ex, "Error in CDMUserCustomerRoleProcess");
            throw;
        }
    }
}
```

#### Account-Site Relationship Management

```csharp
private static string UpsertShipToAndLinkSite(dynamic jsonData, IOrganizationService service, TraceWriter log)
{
    using (var transaction = new TransactionScope())
    {
        try
        {
            // Find or create site
            var siteReference = GetOrCreateSite(jsonData.siteId.ToString(), service, log);

            // Find account
            var accountReference = GetAccountByExternalId(jsonData.accountId.ToString(), service);

            if (accountReference != null && siteReference != null)
            {
                // Create ship-to relationship
                var shipTo = new Entity("ecolab_shipto");
                shipTo["ecolab_account"] = accountReference;
                shipTo["ecolab_site"] = siteReference;
                shipTo["ecolab_externalid"] = jsonData.shipToId?.ToString();

                var shipToId = service.Create(shipTo);
                log.LogInformation($"Created ship-to relationship: {shipToId}");
            }

            transaction.Complete();
            return "Ship-to relationship created successfully";
        }
        catch (Exception ex)
        {
            log.LogError(ex, "Error in UpsertShipToAndLinkSite");
            throw;
        }
    }
}
```

### Error Handling and Validation

#### Comprehensive Error Handling

```csharp
private static void ValidateJsonData(dynamic jsonData, TraceWriter log)
{
    if (string.IsNullOrEmpty(jsonData.email?.ToString()))
    {
        throw new ArgumentException("Email is required for user processing");
    }

    if (string.IsNullOrEmpty(jsonData.userId?.ToString()))
    {
        throw new ArgumentException("UserId is required for user processing");
    }

    log.LogInformation("JSON data validation passed");
}
```

#### Duplicate Prevention

```csharp
private static EntityReference GetOrCreateSite(string siteId, IOrganizationService service, TraceWriter log)
{
    // Check if site exists
    string fetchXml = $@"
        <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
            <entity name='ecolab_site'>
                <attribute name='ecolab_siteid' />
                <attribute name='ecolab_name' />
                <filter type='and'>
                    <condition attribute='ecolab_externalid' operator='eq' value='{siteId}' />
                    <condition attribute='statecode' operator='eq' value='0' />
                </filter>
            </entity>
        </fetch>";

    var result = service.RetrieveMultiple(new FetchExpression(fetchXml));

    if (result.Entities.Count > 0)
    {
        log.LogInformation($"Site already exists: {siteId}");
        return result.Entities[0].ToEntityReference();
    }

    // Create new site
    var site = new Entity("ecolab_site");
    site["ecolab_externalid"] = siteId;
    site["ecolab_name"] = $"Site {siteId}";

    var siteGuid = service.Create(site);
    log.LogInformation($"Created new site: {siteGuid}");

    return new EntityReference("ecolab_site", siteGuid);
}
```

### Transaction Management

#### Transaction Scope Usage

```csharp
using (var transaction = new TransactionScope(TransactionScopeOption.Required,
    new TransactionOptions { IsolationLevel = IsolationLevel.ReadCommitted }))
{
    try
    {
        // Multiple CRM operations
        var contactId = service.Create(contact);
        var roleId = service.Create(role);
        var relationshipId = service.Create(relationship);

        transaction.Complete();
        log.LogInformation("All operations completed successfully");
    }
    catch (Exception ex)
    {
        log.LogError(ex, "Transaction failed, rolling back all changes");
        throw;
    }
}
```

## Pros and Cons of the Options

### Microsoft.Xrm.Sdk with FetchXML

Current recommended approach using native CRM SDK.

* **Business Benefits**: Reliable data operations with transaction support
* **Technical Advantages**: Optimized queries, native CRM operations, comprehensive error handling
* **Good, because**: Ensures data consistency and prevents corruption
* **Business Risks**: Learning curve for FetchXML syntax
* **Technical Challenges**: Complex query construction, transaction management overhead
* **Bad, because**: Requires deep understanding of CRM data model

### REST API Integration

Use Dynamics 365 Web API instead of SDK.

* **Business Benefits**: Modern API approach, easier to learn
* **Technical Advantages**: RESTful interface, JSON payloads, simpler authentication
* **Good, because**: More accessible for new developers
* **Business Risks**: Potential performance issues with complex queries
* **Technical Challenges**: Limited transaction support, batch operation complexity
* **Bad, because**: Less efficient for complex entity relationships

## Consequences

### Positive Consequences

* **Business Impact**: Reliable data synchronization with transaction guarantees
* **Technical Impact**: Optimized performance and maintainable code structure
* **Operational Impact**: Clear error visibility and rollback capabilities

### Negative Consequences

* **Business Impact**: Initial learning curve for CRM data model understanding
* **Technical Impact**: Complex FetchXML query construction
* **Operational Impact**: Transaction overhead for simple operations

## Implementation Guidance

### Adding New CRM Operations

#### Basic Entity Creation

```csharp
private static Guid CreateEntity(string entityName, Dictionary<string, object> attributes, IOrganizationService service)
{
    var entity = new Entity(entityName);

    foreach (var attribute in attributes)
    {
        entity[attribute.Key] = attribute.Value;
    }

    return service.Create(entity);
}
```

#### Advanced Query with Joins

```csharp
private static EntityCollection GetUsersWithAccounts(IOrganizationService service)
{
    string fetchXml = @"
        <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
            <entity name='contact'>
                <attribute name='contactid' />
                <attribute name='firstname' />
                <attribute name='lastname' />
                <attribute name='emailaddress1' />
                <link-entity name='ecolab_useraccount' from='ecolab_userid' to='contactid' alias='ua'>
                    <link-entity name='account' from='accountid' to='ecolab_accountid' alias='acc'>
                        <attribute name='name' />
                        <attribute name='accountnumber' />
                    </link-entity>
                </link-entity>
            </entity>
        </fetch>";

    return service.RetrieveMultiple(new FetchExpression(fetchXml));
}
```

### Best Practices

#### Query Optimization

- Use FetchXML instead of QueryExpression for complex queries
- Include only required attributes in fetch statements
- Use appropriate filter conditions to limit result sets
- Consider indexed fields for frequently queried attributes

#### Error Handling

```csharp
try
{
    var result = service.Retrieve(entityName, entityId, columnSet);
}
catch (FaultException<OrganizationServiceFault> ex)
{
    switch (ex.Detail.ErrorCode)
    {
        case -2147220969: // Object does not exist
            log.LogWarning("Entity not found: {EntityId}", entityId);
            return null;
        default:
            log.LogError(ex, "CRM operation failed: {ErrorCode}", ex.Detail.ErrorCode);
            throw;
    }
}
```

#### Performance Considerations

- Batch multiple operations when possible
- Use ExecuteMultipleRequest for bulk operations
- Implement proper connection pooling
- Cache frequently accessed reference data

## Testing Strategy

### Unit Testing with Mock Service

```csharp
[TestMethod]
public void IsExistsCDMUser_UserExists_ReturnsTrue()
{
    // Arrange
    var mockService = new Mock<IOrganizationService>();
    var contact = new Entity("contact");
    contact["contactid"] = Guid.NewGuid();
    contact["emailaddress1"] = "test@example.com";

    mockService.Setup(s => s.RetrieveMultiple(It.IsAny<FetchExpression>()))
               .Returns(new EntityCollection(new List<Entity> { contact }));

    // Act
    var result = Common.IsExistsCDMUser("test@example.com", mockService.Object, log);

    // Assert
    Assert.IsTrue(result);
}
```

### Integration Testing

```csharp
[TestMethod]
public void CDMUserCustomerRoleProcess_ValidData_CreatesUserAndRole()
{
    // Arrange
    var jsonData = new
    {
        email = "newuser@example.com",
        firstName = "John",
        lastName = "Doe",
        userId = "12345",
        roleCode = "27"
    };

    // Act
    var result = ProcessSubscriptionMessage.CDMUserCustomerRoleProcess(jsonData, service, log);

    // Assert
    Assert.IsTrue(result.Contains("successfully"));
    // Verify user was created in CRM
    // Verify role was assigned
}
```

## Success Metrics

### Technical Metrics

* **Data Accuracy**: 99.9% successful CRM operations
* **Transaction Success Rate**: 99.5% transaction completion rate
* **Query Performance**: <2 second average query response time
* **Duplicate Prevention**: 0% duplicate records created

### Operational Metrics

* **Error Recovery**: <1 hour mean time to resolve CRM integration errors
* **Data Consistency**: 100% referential integrity maintained
* **Monitoring Coverage**: 100% of CRM operations logged

## More Information

### Key Files to Understand

- `Common.cs` - Shared CRM utility functions
- `ProcessSubscriptionMessage.cs` - CRM entity operations
- `ProcessQueue.cs` - CRM data manipulation logic

### Related Patterns

- **Repository Pattern**: For encapsulating CRM data access
- **Unit of Work**: For managing complex transactions
- **CQRS**: For separating read and write operations

* **Related Documents**: Dynamics 365 SDK documentation, FetchXML reference guide
* **Assumptions**: CRM data model remains stable, sufficient API limits available
* **Dependencies**: Microsoft.Xrm.Sdk, TransactionScope, Application Insights
* **Future Considerations**: Evaluate Dynamics 365 Web API migration for new features

---

## Acornsoft Metadata

**Status**: proposed

**Date**: 2025-10-01

**Acornsoft Practice**: Data Integration

**Client Engagement Manager**: {TBD}

**Delivery Lead**: {TBD}

**Solution Architect**: {TBD}

**Technical Architect**: {TBD}

**Project Manager**: {TBD}

**Decision Makers**:
* Ecolab IT Architecture Team
* Acornsoft Cloud Practice Lead

**Consulted**:
* CRM Developers - Subject Matter Experts
* Data Architects - Technical Experts

**Informed**:
* Operations Team - Monitoring requirements
* Business Analysts - Data consistency requirements

**Supersedes**: N/A

**Superseded by**: N/A

---

*Acornsoft ADR Template v1.0 | Based on MADR 4.0.0 | Acornsoft Confidential*