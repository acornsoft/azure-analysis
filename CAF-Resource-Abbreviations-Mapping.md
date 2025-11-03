# Azure Resource Abbreviations Mapping for ADR Toolkit

This document maps Microsoft Azure Cloud Adoption Framework (CAF) resource abbreviations to ADR Toolkit types for consistent naming and analysis.

## Current ADR Toolkit Types → CAF Abbreviations

### Existing Types (Already Implemented)

| ADR Type | CAF Abbrev | Azure Resource Type | Status |
|----------|------------|-------------------|---------|
| `aa` | `aa` | Microsoft.Automation/automationAccounts | ✅ Implemented |
| `adf` | `adf` | Microsoft.DataFactory/factories | ✅ Implemented |
| `ag` | `ag` | Microsoft.Insights/actionGroups | ✅ Implemented |
| `apim` | `apim` | Microsoft.ApiManagement/service | ✅ Implemented |
| `app` | `app` | Microsoft.Web/sites | ✅ Implemented |
| `appi` | `appi` | Microsoft.Insights/components | ✅ Implemented |
| `asp` | `asp` | Microsoft.Web/serverFarms | ✅ Implemented |
| `dcr` | `dcr` | Microsoft.Insights/dataCollectionRules | ✅ Implemented |
| `func` | `func` | Microsoft.Web/sites | ✅ Implemented |
| `kv` | `kv` | Microsoft.KeyVault/vaults | ✅ Implemented |
| `log` | `log` | Microsoft.OperationalInsights/workspaces | ✅ Implemented |
| `logic` | `logic` | Microsoft.Logic/workflows | ✅ Implemented |
| `mg` | `mg` | Microsoft.Management/managementGroups | ✅ Implemented |
| `rg` | `rg` | Microsoft.Resources/resourceGroups | ✅ Implemented |
| `sbns` | `sbns` | Microsoft.ServiceBus/namespaces | ✅ Implemented |
| `sbq` | `sbq` | Microsoft.ServiceBus/namespaces/queues | ✅ Implemented |
| `sbt` | `sbt` | Microsoft.ServiceBus/namespaces/topics | ✅ Implemented |
| `sbts` | `sbts` | Microsoft.ServiceBus/namespaces/topics/subscriptions | ✅ Implemented |
| `vm` | `vm` | Microsoft.Compute/virtualMachines | ✅ Implemented |

## New Types to Add (CAF Abbreviations)

### AI + Machine Learning

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `ais` | Microsoft.CognitiveServices/accounts (CognitiveServices) | High | Multi-service AI accounts |
| `aif` | Microsoft.CognitiveServices/accounts (AIServices) | High | Azure AI Foundry accounts |
| `hub` | Microsoft.MachineLearningServices/workspaces (Hub) | Medium | AI Foundry hubs |
| `proj` | Microsoft.MachineLearningServices/workspaces (Project) | Medium | AI Foundry projects |
| `avi` | Microsoft.VideoIndexer/accounts | Low | Video indexing services |
| `mlw` | Microsoft.MachineLearningServices/workspaces | High | ML workspaces |
| `oai` | Microsoft.CognitiveServices/accounts (OpenAI) | High | OpenAI services |
| `cv` | Microsoft.CognitiveServices/accounts (ComputerVision) | Medium | Computer vision |
| `cstv` | Microsoft.CognitiveServices/accounts (CustomVision.Prediction) | Low | Custom vision prediction |
| `cstvt` | Microsoft.CognitiveServices/accounts (CustomVision.Training) | Low | Custom vision training |
| `di` | Microsoft.CognitiveServices/accounts (FormRecognizer) | Medium | Document intelligence |
| `face` | Microsoft.CognitiveServices/accounts (Face) | Low | Face recognition |
| `hi` | Microsoft.CognitiveServices/accounts (HealthInsights) | Low | Health insights |
| `ir` | Microsoft.CognitiveServices/accounts (ImmersiveReader) | Low | Immersive reader |
| `lang` | Microsoft.CognitiveServices/accounts (TextAnalytics) | Medium | Language services |
| `spch` | Microsoft.CognitiveServices/accounts (SpeechServices) | Medium | Speech services |
| `trsl` | Microsoft.CognitiveServices/accounts (TextTranslation) | Medium | Translation services |

### Analytics and IoT

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `as` | Microsoft.AnalysisServices/servers | Medium | Analysis Services |
| `dbac` | Microsoft.Databricks/workspaces/accessConnectors | Low | Databricks connectors |
| `dbw` | Microsoft.Databricks/workspaces | High | Databricks workspaces |
| `dec` | Microsoft.Kusto/clusters | High | Data Explorer clusters |
| `dedb` | Microsoft.Kusto/clusters/databases | High | Data Explorer databases |
| `dt` | Microsoft.DigitalTwins/digitalTwinsInstances | Medium | Digital Twins |
| `asa` | Microsoft.StreamAnalytics/cluster | Medium | Stream Analytics |
| `synplh` | Microsoft.Synapse/privateLinkHubs | Low | Synapse private links |
| `syndp` | Microsoft.Synapse/workspaces/sqlPools | High | Synapse dedicated pools |
| `synsp` | Microsoft.Synapse/workspaces/bigDataPools | High | Synapse Spark pools |
| `synw` | Microsoft.Synapse/workspaces | High | Synapse workspaces |
| `dls` | Microsoft.DataLakeStore/accounts | Medium | Data Lake Store |
| `dla` | Microsoft.DataLakeAnalytics/accounts | Low | Data Lake Analytics |
| `evhns` | Microsoft.EventHub/namespaces | High | Event Hub namespaces |
| `evh` | Microsoft.EventHub/namespaces/eventHubs | High | Event Hubs |
| `evgd` | Microsoft.EventGrid/domains | Medium | Event Grid domains |
| `evgns` | Microsoft.EventGrid/namespaces | Medium | Event Grid namespaces |
| `evgs` | Microsoft.EventGrid/eventSubscriptions | Medium | Event Grid subscriptions |
| `evgt` | Microsoft.EventGrid/domains/topics | Medium | Event Grid topics |
| `egst` | Microsoft.EventGrid/systemTopics | Low | Event Grid system topics |
| `fc` | Microsoft.Fabric/capacities | Medium | Fabric capacities |
| `hadoop` | Microsoft.HDInsight/clusters | Medium | HDInsight Hadoop |
| `hbase` | Microsoft.HDInsight/clusters | Low | HDInsight HBase |
| `kafka` | Microsoft.HDInsight/clusters | Medium | HDInsight Kafka |
| `spark` | Microsoft.HDInsight/clusters | Medium | HDInsight Spark |
| `mls` | Microsoft.HDInsight/clusters | Low | HDInsight ML Services |
| `iot` | Microsoft.Devices/IotHubs | High | IoT Hubs |
| `prov` | Microsoft.Devices/provisioningServices | Medium | Device provisioning |
| `pcert` | Microsoft.Devices/provisioningServices/certificates | Low | Provisioning certificates |
| `pbi` | Microsoft.PowerBIDedicated/capacities | Medium | Power BI Embedded |
| `tsi` | Microsoft.TimeSeriesInsights/environments | Low | Time Series Insights |

### Compute and Web

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `ase` | Microsoft.Web/hostingEnvironments | Medium | App Service Environments |
| `host` | Microsoft.Web/hostingEnvironments | Low | Hosting environments |
| `lt` | Microsoft.LoadTestService/loadTests | Low | Load testing |
| `avail` | Microsoft.Compute/availabilitySets | Medium | Availability sets |
| `arcs` | Microsoft.HybridCompute/machines | Low | Arc servers |
| `arck` | Microsoft.Kubernetes/connectedClusters | Medium | Arc Kubernetes |
| `pls` | Microsoft.HybridCompute/privateLinkScopes | Low | Private link scopes |
| `arcgw` | Microsoft.HybridCompute/gateways | Low | Arc gateways |
| `ba` | Microsoft.Batch/batchAccounts | Medium | Batch accounts |
| `cld` | Microsoft.Compute/cloudServices | Low | Cloud services |
| `acs` | Microsoft.Communication/communicationServices | Medium | Communication Services |
| `des` | Microsoft.Compute/diskEncryptionSets | Low | Disk encryption sets |
| `gal` | Microsoft.Compute/galleries | Low | Compute galleries |
| `it` | Microsoft.VirtualMachineImages/imageTemplates | Low | Image templates |
| `osdisk` | Microsoft.Compute/disks | Low | OS disks |
| `disk` | Microsoft.Compute/disks | Low | Data disks |
| `ntf` | Microsoft.NotificationHubs/namespaces/notificationHubs | Low | Notification Hubs |
| `ntfns` | Microsoft.NotificationHubs/namespaces | Low | Notification namespaces |
| `ppg` | Microsoft.Compute/proximityPlacementGroups | Low | Proximity groups |
| `rpc` | Microsoft.Compute/restorePointCollections | Low | Restore point collections |
| `snap` | Microsoft.Compute/snapshots | Low | Disk snapshots |
| `stvm` | Microsoft.Storage/storageAccounts | Low | VM storage accounts |
| `vmss` | Microsoft.Compute/virtualMachineScaleSets | High | VM scale sets |
| `mc` | Microsoft.Maintenance/maintenanceConfigurations | Low | Maintenance configs |
| `stapp` | Microsoft.Web/staticSites | Medium | Static web apps |

### Containers

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `aks` | Microsoft.ContainerService/managedClusters | High | AKS clusters |
| `npsystem` | Microsoft.ContainerService/managedClusters/agentPools | Low | AKS system node pools |
| `np` | Microsoft.ContainerService/managedClusters/agentPools | Low | AKS user node pools |
| `ca` | Microsoft.App/containerApps | High | Container Apps |
| `cae` | Microsoft.App/managedEnvironments | High | Container App environments |
| `caj` | Microsoft.App/jobs | Medium | Container App jobs |
| `cr` | Microsoft.ContainerRegistry/registries | High | Container registries |
| `ci` | Microsoft.ContainerInstance/containerGroups | Medium | Container instances |
| `sf` | Microsoft.ServiceFabric/clusters | Medium | Service Fabric clusters |
| `sfmc` | Microsoft.ServiceFabric/managedClusters | Medium | Service Fabric managed |

### Databases

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `cosmos` | Microsoft.DocumentDB/databaseAccounts/sqlDatabases | High | Cosmos DB databases |
| `coscas` | Microsoft.DocumentDB/databaseAccounts | High | Cosmos Cassandra |
| `cosmon` | Microsoft.DocumentDB/databaseAccounts | High | Cosmos MongoDB |
| `cosno` | Microsoft.DocumentDb/databaseAccounts | High | Cosmos NoSQL |
| `costab` | Microsoft.DocumentDb/databaseAccounts | Medium | Cosmos Table |
| `cosgrm` | Microsoft.DocumentDb/databaseAccounts | Low | Cosmos Gremlin |
| `cospos` | Microsoft.DBforPostgreSQL/serverGroupsv2 | Medium | Cosmos PostgreSQL |
| `redis` | Microsoft.Cache/Redis | High | Redis Cache |
| `amr` | Microsoft.Cache/RedisEnterprise | Medium | Redis Enterprise |
| `sql` | Microsoft.Sql/servers | High | SQL Servers |
| `sqldb` | Microsoft.Sql/servers/databases | High | SQL Databases |
| `sqlel` | Microsoft.Sql/servers/elasticpool | High | SQL Elastic Pools |
| `sqlja` | Microsoft.Sql/servers/jobAgents | Low | SQL Job Agents |
| `sqlep` | Microsoft.Sql/servers/elasticpool | High | SQL Elastic Pools |
| `mysql` | Microsoft.DBforMySQL/servers | High | MySQL servers |
| `psql` | Microsoft.DBforPostgreSQL/servers | High | PostgreSQL servers |
| `sqlstrdb` | Microsoft.Sql/servers/databases | Low | SQL Stretch DB |
| `sqlmi` | Microsoft.Sql/managedInstances | High | SQL Managed Instances |

### Developer Tools

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `appcs` | Microsoft.AppConfiguration/configurationStores | High | App Configuration |
| `map` | Microsoft.Maps/accounts | Medium | Maps accounts |
| `sigr` | Microsoft.SignalRService/SignalR | Medium | SignalR |
| `wps` | Microsoft.SignalRService/webPubSub | Medium | Web PubSub |

### Integration

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `ia` | Microsoft.Logic/integrationAccounts | Medium | Integration accounts |

### Management and Governance

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `apr` | Microsoft.AlertsManagement/actionRules | Low | Alert processing rules |
| `bp` | Microsoft.Blueprint/blueprints | Low | Blueprints |
| `bpa` | Microsoft.Blueprint/blueprints/artifacts | Low | Blueprint artifacts |
| `dce` | Microsoft.Insights/dataCollectionEndpoints | Medium | Data collection endpoints |
| `script` | Microsoft.Resources/deploymentScripts | Low | Deployment scripts |
| `pack` | Microsoft.OperationalInsights/querypacks | Low | Query packs |

### Migration

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `migr` | Microsoft.Migrate/assessmentProjects | Medium | Migration projects |
| `dms` | Microsoft.DataMigration/services | High | Database Migration Service |
| `rsv` | Microsoft.RecoveryServices/vaults | High | Recovery Services vaults |

### Networking

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `agw` | Microsoft.Network/applicationGateways | High | Application gateways |
| `asg` | Microsoft.Network/applicationSecurityGroups | Medium | Application security groups |
| `cdnp` | Microsoft.Cdn/profiles | Medium | CDN profiles |
| `cdne` | Microsoft.Cdn/profiles/endpoints | Medium | CDN endpoints |
| `con` | Microsoft.Network/connections | Low | Network connections |
| `dnsfrs` | Microsoft.Network/dnsForwardingRulesets | Low | DNS forwarding rulesets |
| `dnspr` | Microsoft.Network/dnsResolvers | Low | DNS private resolvers |
| `in` | Microsoft.Network/dnsResolvers/inboundEndpoints | Low | DNS inbound endpoints |
| `out` | Microsoft.Network/dnsResolvers/outboundEndpoints | Low | DNS outbound endpoints |
| `pdnsz` | Microsoft.Network/privateDnsZones | Medium | Private DNS zones |
| `afw` | Microsoft.Network/azureFirewalls | High | Azure Firewalls |
| `afwp` | Microsoft.Network/firewallPolicies | High | Firewall policies |
| `erc` | Microsoft.Network/expressRouteCircuits | High | ExpressRoute circuits |
| `erd` | Microsoft.Network/expressRoutePorts | Medium | ExpressRoute direct |
| `ergw` | Microsoft.Network/virtualNetworkGateways | High | ExpressRoute gateways |
| `afd` | Microsoft.Cdn/profiles | High | Front Door (classic) |
| `fde` | Microsoft.Cdn/profiles/afdEndpoints | High | Front Door endpoints |
| `fdfp` | Microsoft.Network/frontdoorWebApplicationFirewallPolicies | Medium | Front Door WAF policies |
| `ipg` | Microsoft.Network/ipGroups | Low | IP groups |
| `lbi` | Microsoft.Network/loadBalancers | High | Internal load balancers |
| `lbe` | Microsoft.Network/loadBalancers | High | External load balancers |
| `rule` | Microsoft.Network/loadBalancers/inboundNatRules | Low | Load balancer rules |
| `lgw` | Microsoft.Network/localNetworkGateways | Medium | Local network gateways |
| `ng` | Microsoft.Network/natGateways | Medium | NAT gateways |
| `nic` | Microsoft.Network/networkInterfaces | Low | Network interfaces |
| `nsp` | Microsoft.Network/networkSecurityPerimeters | Low | Network security perimeters |
| `nsg` | Microsoft.Network/networkSecurityGroups | High | Network security groups |
| `nsgsr` | Microsoft.Network/networkSecurityGroups/securityRules | High | NSG security rules |
| `nw` | Microsoft.Network/networkWatchers | Medium | Network Watchers |
| `pl` | Microsoft.Network/privateLinkServices | Medium | Private Link services |
| `pep` | Microsoft.Network/privateEndpoints | High | Private endpoints |
| `pip` | Microsoft.Network/publicIPAddresses | High | Public IP addresses |
| `ippre` | Microsoft.Network/publicIPPrefixes | Medium | Public IP prefixes |
| `rf` | Microsoft.Network/routeFilters | Low | Route filters |
| `rtserv` | Microsoft.Network/virtualHubs | Low | Route servers |
| `rt` | Microsoft.Network/routeTables | High | Route tables |
| `vnm` | Microsoft.Network/networkManagers | Low | Virtual network managers |
| `peer` | Microsoft.Network/virtualNetworks/virtualNetworkPeerings | High | VNet peerings |
| `snet` | Microsoft.Network/virtualNetworks/subnets | High | Subnets |
| `vwan` | Microsoft.Network/virtualWans | High | Virtual WANs |
| `vhub` | Microsoft.Network/virtualHubs | High | Virtual WAN hubs |

### Security

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `bas` | Microsoft.Network/bastionHosts | High | Azure Bastion |
| `kvmhsm` | Microsoft.KeyVault/managedHSMs | Low | Key Vault Managed HSM |
| `id` | Microsoft.ManagedIdentity/userAssignedIdentities | High | Managed identities |
| `sshkey` | Microsoft.Compute/sshPublicKeys | Low | SSH keys |
| `vpng` | Microsoft.Network/vpnGateways | High | VPN gateways |
| `vcn` | Microsoft.Network/vpnGateways/vpnConnections | High | VPN connections |
| `vst` | Microsoft.Network/vpnGateways/vpnSites | Medium | VPN sites |
| `waf` | Microsoft.Network/firewallPolicies | High | Web Application Firewall |
| `wafrg` | Microsoft.Network/firewallPolicies/ruleGroups | Medium | WAF rule groups |

### Storage

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `ssimp` | Microsoft.StorSimple/managers | Low | StorSimple |
| `bvault` | Microsoft.DataProtection/backupVaults | High | Backup vaults |
| `bkpol` | Microsoft.DataProtection/backupVaults/backupPolicies | Medium | Backup policies |
| `share` | Microsoft.Storage/storageAccounts/fileServices/shares | High | File shares |
| `st` | Microsoft.Storage/storageAccounts | High | Storage accounts |
| `sss` | Microsoft.StorageSync/storageSyncServices | Medium | Storage Sync services |

### Virtual Desktop Infrastructure

| CAF Abbrev | Azure Resource Type | Priority | Use Case |
|------------|-------------------|----------|----------|
| `vdpool` | Microsoft.DesktopVirtualization/hostPools | High | Virtual desktop host pools |
| `vdag` | Microsoft.DesktopVirtualization/applicationGroups | High | Virtual desktop app groups |
| `vdws` | Microsoft.DesktopVirtualization/workspaces | High | Virtual desktop workspaces |
| `vdscaling` | Microsoft.DesktopVirtualization/scalingPlans | Medium | Virtual desktop scaling plans |

## Implementation Priority

### Phase 1 (High Priority - Core Azure Services)

1. `cosmos` - Cosmos DB databases
2. `sql` - SQL Servers  
3. `sqldb` - SQL Databases
4. `st` - Storage accounts
5. `vnet` - Virtual networks
6. `nsg` - Network security groups
7. `kv` - Key vaults (already exists)
8. `vm` - Virtual machines (already exists)
9. `aks` - AKS clusters
10. `func` - Functions (already exists)

### Phase 2 (Medium Priority - Enterprise Services)

1. `adf` - Data Factory (already exists)
2. `apim` - API Management (already exists)
3. `logic` - Logic Apps (already exists)
4. `evhns` - Event Hub namespaces
5. `sbns` - Service Bus namespaces (already exists)
6. `redis` - Redis Cache
7. `agw` - Application gateways
8. `afd` - Front Door

### Phase 3 (Low Priority - Specialized Services)

1. AI/ML services (`oai`, `mlw`, `ais`)
2. Analytics services (`synw`, `dbw`, `dec`)
3. IoT services (`iot`)
4. Migration services (`dms`, `rsv`)

## Migration Strategy

1. **Supplement Existing Types**: Enhance current ADR templates with awesome-copilot instructions
2. **Add Missing Types**: Create new ADR type templates for high-priority CAF abbreviations
3. **Standardize Naming**: Use CAF abbreviations as the primary type identifiers
4. **Integrate AI Assistance**: Embed awesome-copilot prompts and chat modes into ADR generation workflow
5. **Update Scripts**: Modify PowerShell scripts to leverage new capabilities

## Awesome-Copilot Integration Points

### Chat Modes to Leverage

- `azure-principal-architect.chatmode.md` - For architectural ADR styles
- `azure-saas-architect.chatmode.md` - For business ADR styles  
- `azure-logic-apps-expert.chatmode.md` - For Logic Apps ADRs
- `terraform-azure-planning.chatmode.md` - For infrastructure planning
- `terraform-azure-implement.chatmode.md` - For implementation details

### Instructions to Apply

- `azure-functions-typescript.instructions.md` - For Functions ADR enhancement
- `azure-logic-apps-power-automate.instructions.md` - For Logic Apps ADR enhancement
- `terraform-azure.instructions.md` - For infrastructure ADR enhancement
- `bicep-code-best-practices.instructions.md` - For Bicep/IaC ADR enhancement

### Prompts to Integrate

- `azure-resource-health-diagnose.prompt.md` - For health analysis sections
- `az-cost-optimize.prompt.md` - For cost optimization recommendations
- `cosmosdb-datamodeling.prompt.md` - For database ADR enhancement

## ADR Analysis Requirements by Service Type

### Standard ADR Analysis Sections

All ADR templates include these core sections:

1. **Executive Summary** - Business context and key findings
2. **Current State Analysis** - Technical assessment of existing implementation
3. **WAF Assessment** - Azure Well-Architected Framework evaluation (5 pillars)
4. **Architectural Recommendations** - Azure Principal Architect guidance
5. **Implementation Roadmap** - Step-by-step migration/deployment plan
6. **Risk Assessment** - Technical and business risks with mitigation strategies
7. **Success Metrics** - KPIs and success criteria

### Service-Specific Analysis Sections by Category

#### AI + Machine Learning Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `ais` | Multi-service AI accounts | WAF Assessment, Azure Principal Architect, AI Service Best Practices, Resource Health Diagnosis, Cost Optimization |
| `aif` | Azure AI Foundry accounts | WAF Assessment, Azure Principal Architect, AI Foundry Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `hub` | AI Foundry hubs | WAF Assessment, Azure Principal Architect, AI Hub Architecture, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `proj` | AI Foundry projects | WAF Assessment, Azure Principal Architect, AI Project Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `avi` | Video indexing services | WAF Assessment, Azure Principal Architect, Video AI Best Practices, Resource Health Diagnosis, Cost Optimization |
| `mlw` | ML workspaces | WAF Assessment, Azure Principal Architect, ML Workspace Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `oai` | OpenAI services | WAF Assessment, Azure Principal Architect, OpenAI Best Practices, Resource Health Diagnosis, Cost Optimization, Responsible AI Assessment |
| `cv` | Computer vision | WAF Assessment, Azure Principal Architect, Computer Vision Best Practices, Resource Health Diagnosis, Cost Optimization |
| `cstv` | Custom vision prediction | WAF Assessment, Azure Principal Architect, Custom Vision Best Practices, Resource Health Diagnosis, Cost Optimization |
| `cstvt` | Custom vision training | WAF Assessment, Azure Principal Architect, Custom Vision Training Best Practices, Resource Health Diagnosis, Cost Optimization |
| `di` | Document intelligence | WAF Assessment, Azure Principal Architect, Document Intelligence Best Practices, Resource Health Diagnosis, Cost Optimization |
| `face` | Face recognition | WAF Assessment, Azure Principal Architect, Face Recognition Best Practices, Resource Health Diagnosis, Cost Optimization, Privacy Assessment |
| `hi` | Health insights | WAF Assessment, Azure Principal Architect, Health AI Best Practices, Resource Health Diagnosis, Cost Optimization, Compliance Assessment |
| `ir` | Immersive reader | WAF Assessment, Azure Principal Architect, Immersive Reader Best Practices, Resource Health Diagnosis, Cost Optimization |
| `lang` | Language services | WAF Assessment, Azure Principal Architect, Language Services Best Practices, Resource Health Diagnosis, Cost Optimization |
| `spch` | Speech services | WAF Assessment, Azure Principal Architect, Speech Services Best Practices, Resource Health Diagnosis, Cost Optimization |
| `trsl` | Translation services | WAF Assessment, Azure Principal Architect, Translation Services Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Analytics and IoT Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `as` | Analysis Services | WAF Assessment, Azure Principal Architect, Analysis Services Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `dbac` | Databricks connectors | WAF Assessment, Azure Principal Architect, Databricks Connector Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dbw` | Databricks workspaces | WAF Assessment, Azure Principal Architect, Databricks Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `dec` | Data Explorer clusters | WAF Assessment, Azure Principal Architect, Data Explorer Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `dedb` | Data Explorer databases | WAF Assessment, Azure Principal Architect, Data Explorer Database Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dt` | Digital Twins | WAF Assessment, Azure Principal Architect, Digital Twins Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `asa` | Stream Analytics | WAF Assessment, Azure Principal Architect, Stream Analytics Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `synplh` | Synapse private links | WAF Assessment, Azure Principal Architect, Synapse Networking Best Practices, Resource Health Diagnosis, Cost Optimization |
| `syndp` | Synapse dedicated pools | WAF Assessment, Azure Principal Architect, Synapse Dedicated Pool Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `synsp` | Synapse Spark pools | WAF Assessment, Azure Principal Architect, Synapse Spark Pool Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `synw` | Synapse workspaces | WAF Assessment, Azure Principal Architect, Synapse Workspace Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `dls` | Data Lake Store | WAF Assessment, Azure Principal Architect, Data Lake Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `dla` | Data Lake Analytics | WAF Assessment, Azure Principal Architect, Data Lake Analytics Best Practices, Resource Health Diagnosis, Cost Optimization |
| `evhns` | Event Hub namespaces | WAF Assessment, Azure Principal Architect, Event Hub Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `evh` | Event Hubs | WAF Assessment, Azure Principal Architect, Event Hub Best Practices, Resource Health Diagnosis, Cost Optimization |
| `evgd` | Event Grid domains | WAF Assessment, Azure Principal Architect, Event Grid Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `evgns` | Event Grid namespaces | WAF Assessment, Azure Principal Architect, Event Grid Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `evgs` | Event Grid subscriptions | WAF Assessment, Azure Principal Architect, Event Grid Best Practices, Resource Health Diagnosis, Cost Optimization |
| `evgt` | Event Grid topics | WAF Assessment, Azure Principal Architect, Event Grid Best Practices, Resource Health Diagnosis, Cost Optimization |
| `egst` | Event Grid system topics | WAF Assessment, Azure Principal Architect, Event Grid Best Practices, Resource Health Diagnosis, Cost Optimization |
| `fc` | Fabric capacities | WAF Assessment, Azure Principal Architect, Fabric Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `hadoop` | HDInsight Hadoop | WAF Assessment, Azure Principal Architect, HDInsight Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `hbase` | HDInsight HBase | WAF Assessment, Azure Principal Architect, HDInsight Best Practices, Resource Health Diagnosis, Cost Optimization |
| `kafka` | HDInsight Kafka | WAF Assessment, Azure Principal Architect, HDInsight Kafka Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `spark` | HDInsight Spark | WAF Assessment, Azure Principal Architect, HDInsight Spark Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `mls` | HDInsight ML Services | WAF Assessment, Azure Principal Architect, HDInsight ML Best Practices, Resource Health Diagnosis, Cost Optimization |
| `iot` | IoT Hubs | WAF Assessment, Azure Principal Architect, IoT Hub Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `prov` | Device provisioning | WAF Assessment, Azure Principal Architect, Device Provisioning Best Practices, Resource Health Diagnosis, Cost Optimization |
| `pcert` | Provisioning certificates | WAF Assessment, Azure Principal Architect, Certificate Management Best Practices, Resource Health Diagnosis, Cost Optimization |
| `pbi` | Power BI Embedded | WAF Assessment, Azure Principal Architect, Power BI Embedded Best Practices, Resource Health Diagnosis, Cost Optimization |
| `tsi` | Time Series Insights | WAF Assessment, Azure Principal Architect, Time Series Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Compute and Web Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `ase` | App Service Environments | WAF Assessment, Azure Principal Architect, App Service Environment Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `host` | Hosting environments | WAF Assessment, Azure Principal Architect, Hosting Environment Best Practices, Resource Health Diagnosis, Cost Optimization |
| `lt` | Load testing | WAF Assessment, Azure Principal Architect, Load Testing Best Practices, Resource Health Diagnosis, Cost Optimization |
| `avail` | Availability sets | WAF Assessment, Azure Principal Architect, Availability Set Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `arcs` | Arc servers | WAF Assessment, Azure Principal Architect, Arc Server Best Practices, Resource Health Diagnosis, Cost Optimization |
| `arck` | Arc Kubernetes | WAF Assessment, Azure Principal Architect, Arc Kubernetes Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `pls` | Private link scopes | WAF Assessment, Azure Principal Architect, Private Link Best Practices, Resource Health Diagnosis, Cost Optimization |
| `arcgw` | Arc gateways | WAF Assessment, Azure Principal Architect, Arc Gateway Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ba` | Batch accounts | WAF Assessment, Azure Principal Architect, Batch Processing Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cld` | Cloud services | WAF Assessment, Azure Principal Architect, Cloud Service Best Practices, Resource Health Diagnosis, Cost Optimization |
| `acs` | Communication Services | WAF Assessment, Azure Principal Architect, Communication Services Best Practices, Resource Health Diagnosis, Cost Optimization |
| `des` | Disk encryption sets | WAF Assessment, Azure Principal Architect, Disk Encryption Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `gal` | Compute galleries | WAF Assessment, Azure Principal Architect, Compute Gallery Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `it` | Image templates | WAF Assessment, Azure Principal Architect, Image Template Best Practices, Resource Health Diagnosis, Cost Optimization |
| `osdisk` | OS disks | WAF Assessment, Azure Principal Architect, Disk Management Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `disk` | Data disks | WAF Assessment, Azure Principal Architect, Disk Management Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `ntf` | Notification Hubs | WAF Assessment, Azure Principal Architect, Notification Hub Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ntfns` | Notification namespaces | WAF Assessment, Azure Principal Architect, Notification Namespace Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ppg` | Proximity groups | WAF Assessment, Azure Principal Architect, Proximity Placement Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `rpc` | Restore point collections | WAF Assessment, Azure Principal Architect, Backup Best Practices, Resource Health Diagnosis, Cost Optimization |
| `snap` | Disk snapshots | WAF Assessment, Azure Principal Architect, Snapshot Management Best Practices, Resource Health Diagnosis, Cost Optimization |
| `stvm` | VM storage accounts | WAF Assessment, Azure Principal Architect, VM Storage Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vmss` | VM scale sets | WAF Assessment, Azure Principal Architect, VM Scale Set Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `mc` | Maintenance configs | WAF Assessment, Azure Principal Architect, Maintenance Best Practices, Resource Health Diagnosis, Cost Optimization |
| `stapp` | Static web apps | WAF Assessment, Azure Principal Architect, Static Web App Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Container Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `aks` | AKS clusters | WAF Assessment, Azure Principal Architect, AKS Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization, Kubernetes Best Practices |
| `npsystem` | AKS system node pools | WAF Assessment, Azure Principal Architect, AKS Node Pool Best Practices, Resource Health Diagnosis, Cost Optimization |
| `np` | AKS user node pools | WAF Assessment, Azure Principal Architect, AKS Node Pool Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ca` | Container Apps | WAF Assessment, Azure Principal Architect, Container App Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cae` | Container App environments | WAF Assessment, Azure Principal Architect, Container Environment Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `caj` | Container App jobs | WAF Assessment, Azure Principal Architect, Container Job Best Practices, Resource Health Diagnosis, Cost Optimization |
| `cr` | Container registries | WAF Assessment, Azure Principal Architect, Container Registry Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `ci` | Container instances | WAF Assessment, Azure Principal Architect, Container Instance Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sf` | Service Fabric clusters | WAF Assessment, Azure Principal Architect, Service Fabric Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sfmc` | Service Fabric managed | WAF Assessment, Azure Principal Architect, Service Fabric Managed Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Database Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `cosmos` | Cosmos DB databases | WAF Assessment, Azure Principal Architect, Cosmos DB Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization, Data Modeling |
| `coscas` | Cosmos Cassandra | WAF Assessment, Azure Principal Architect, Cosmos Cassandra Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cosmon` | Cosmos MongoDB | WAF Assessment, Azure Principal Architect, Cosmos MongoDB Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cosno` | Cosmos NoSQL | WAF Assessment, Azure Principal Architect, Cosmos NoSQL Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `costab` | Cosmos Table | WAF Assessment, Azure Principal Architect, Cosmos Table Best Practices, Resource Health Diagnosis, Cost Optimization |
| `cosgrm` | Cosmos Gremlin | WAF Assessment, Azure Principal Architect, Cosmos Gremlin Best Practices, Resource Health Diagnosis, Cost Optimization |
| `cospos` | Cosmos PostgreSQL | WAF Assessment, Azure Principal Architect, Cosmos PostgreSQL Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `redis` | Redis Cache | WAF Assessment, Azure Principal Architect, Redis Cache Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `amr` | Redis Enterprise | WAF Assessment, Azure Principal Architect, Redis Enterprise Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sql` | SQL Servers | WAF Assessment, Azure Principal Architect, SQL Server Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sqldb` | SQL Databases | WAF Assessment, Azure Principal Architect, SQL Database Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sqlel` | SQL Elastic Pools | WAF Assessment, Azure Principal Architect, SQL Elastic Pool Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sqlja` | SQL Job Agents | WAF Assessment, Azure Principal Architect, SQL Job Agent Best Practices, Resource Health Diagnosis, Cost Optimization |
| `sqlep` | SQL Elastic Pools | WAF Assessment, Azure Principal Architect, SQL Elastic Pool Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `mysql` | MySQL servers | WAF Assessment, Azure Principal Architect, MySQL Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `psql` | PostgreSQL servers | WAF Assessment, Azure Principal Architect, PostgreSQL Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sqlstrdb` | SQL Stretch DB | WAF Assessment, Azure Principal Architect, SQL Stretch Best Practices, Resource Health Diagnosis, Cost Optimization |
| `sqlmi` | SQL Managed Instances | WAF Assessment, Azure Principal Architect, SQL MI Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Developer Tools Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `appcs` | App Configuration | WAF Assessment, Azure Principal Architect, App Configuration Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `map` | Maps accounts | WAF Assessment, Azure Principal Architect, Maps Service Best Practices, Resource Health Diagnosis, Cost Optimization |
| `sigr` | SignalR | WAF Assessment, Azure Principal Architect, SignalR Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `wps` | Web PubSub | WAF Assessment, Azure Principal Architect, Web PubSub Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Integration Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `ia` | Integration accounts | WAF Assessment, Azure Principal Architect, Integration Account Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Management and Governance Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `apr` | Alert processing rules | WAF Assessment, Azure Principal Architect, Alert Management Best Practices, Resource Health Diagnosis, Cost Optimization |
| `bp` | Blueprints | WAF Assessment, Azure Principal Architect, Blueprint Best Practices, Resource Health Diagnosis, Cost Optimization |
| `bpa` | Blueprint artifacts | WAF Assessment, Azure Principal Architect, Blueprint Artifact Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dce` | Data collection endpoints | WAF Assessment, Azure Principal Architect, Data Collection Best Practices, Resource Health Diagnosis, Cost Optimization |
| `script` | Deployment scripts | WAF Assessment, Azure Principal Architect, Deployment Script Best Practices, Resource Health Diagnosis, Cost Optimization |
| `pack` | Query packs | WAF Assessment, Azure Principal Architect, Query Pack Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Migration Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `migr` | Migration projects | WAF Assessment, Azure Principal Architect, Migration Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dms` | Database Migration Service | WAF Assessment, Azure Principal Architect, Database Migration Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `rsv` | Recovery Services vaults | WAF Assessment, Azure Principal Architect, Backup and Recovery Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Networking Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `agw` | Application gateways | WAF Assessment, Azure Principal Architect, Application Gateway Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `asg` | Application security groups | WAF Assessment, Azure Principal Architect, Application Security Group Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cdnp` | CDN profiles | WAF Assessment, Azure Principal Architect, CDN Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `cdne` | CDN endpoints | WAF Assessment, Azure Principal Architect, CDN Endpoint Best Practices, Resource Health Diagnosis, Cost Optimization |
| `con` | Network connections | WAF Assessment, Azure Principal Architect, Network Connection Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dnsfrs` | DNS forwarding rulesets | WAF Assessment, Azure Principal Architect, DNS Best Practices, Resource Health Diagnosis, Cost Optimization |
| `dnspr` | DNS private resolvers | WAF Assessment, Azure Principal Architect, DNS Resolver Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `in` | DNS inbound endpoints | WAF Assessment, Azure Principal Architect, DNS Endpoint Best Practices, Resource Health Diagnosis, Cost Optimization |
| `out` | DNS outbound endpoints | WAF Assessment, Azure Principal Architect, DNS Endpoint Best Practices, Resource Health Diagnosis, Cost Optimization |
| `pdnsz` | Private DNS zones | WAF Assessment, Azure Principal Architect, Private DNS Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `afw` | Azure Firewalls | WAF Assessment, Azure Principal Architect, Firewall Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `afwp` | Firewall policies | WAF Assessment, Azure Principal Architect, Firewall Policy Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `erc` | ExpressRoute circuits | WAF Assessment, Azure Principal Architect, ExpressRoute Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `erd` | ExpressRoute direct | WAF Assessment, Azure Principal Architect, ExpressRoute Direct Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ergw` | ExpressRoute gateways | WAF Assessment, Azure Principal Architect, ExpressRoute Gateway Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `afd` | Front Door (classic) | WAF Assessment, Azure Principal Architect, Front Door Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `fde` | Front Door endpoints | WAF Assessment, Azure Principal Architect, Front Door Endpoint Best Practices, Resource Health Diagnosis, Cost Optimization |
| `fdfp` | Front Door WAF policies | WAF Assessment, Azure Principal Architect, Front Door WAF Best Practices, Resource Health Diagnosis, Cost Optimization |
| `ipg` | IP groups | WAF Assessment, Azure Principal Architect, IP Group Best Practices, Resource Health Diagnosis, Cost Optimization |
| `lbi` | Internal load balancers | WAF Assessment, Azure Principal Architect, Load Balancer Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `lbe` | External load balancers | WAF Assessment, Azure Principal Architect, Load Balancer Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `rule` | Load balancer rules | WAF Assessment, Azure Principal Architect, Load Balancer Rule Best Practices, Resource Health Diagnosis, Cost Optimization |
| `lgw` | Local network gateways | WAF Assessment, Azure Principal Architect, Local Gateway Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `ng` | NAT gateways | WAF Assessment, Azure Principal Architect, NAT Gateway Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `nic` | Network interfaces | WAF Assessment, Azure Principal Architect, Network Interface Best Practices, Resource Health Diagnosis, Cost Optimization |
| `nsp` | Network security perimeters | WAF Assessment, Azure Principal Architect, Network Security Perimeter Best Practices, Resource Health Diagnosis, Cost Optimization |
| `nsg` | Network security groups | WAF Assessment, Azure Principal Architect, NSG Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `nsgsr` | NSG security rules | WAF Assessment, Azure Principal Architect, NSG Rule Best Practices, Resource Health Diagnosis, Cost Optimization |
| `nw` | Network Watchers | WAF Assessment, Azure Principal Architect, Network Watcher Best Practices, Resource Health Diagnosis, Cost Optimization |
| `pl` | Private Link services | WAF Assessment, Azure Principal Architect, Private Link Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `pep` | Private endpoints | WAF Assessment, Azure Principal Architect, Private Endpoint Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `pip` | Public IP addresses | WAF Assessment, Azure Principal Architect, Public IP Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `ippre` | Public IP prefixes | WAF Assessment, Azure Principal Architect, Public IP Prefix Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `rf` | Route filters | WAF Assessment, Azure Principal Architect, Route Filter Best Practices, Resource Health Diagnosis, Cost Optimization |
| `rtserv` | Route servers | WAF Assessment, Azure Principal Architect, Route Server Best Practices, Resource Health Diagnosis, Cost Optimization |
| `rt` | Route tables | WAF Assessment, Azure Principal Architect, Route Table Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vnm` | Virtual network managers | WAF Assessment, Azure Principal Architect, Virtual Network Manager Best Practices, Resource Health Diagnosis, Cost Optimization |
| `peer` | VNet peerings | WAF Assessment, Azure Principal Architect, VNet Peering Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `snet` | Subnets | WAF Assessment, Azure Principal Architect, Subnet Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vwan` | Virtual WANs | WAF Assessment, Azure Principal Architect, Virtual WAN Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vhub` | Virtual WAN hubs | WAF Assessment, Azure Principal Architect, Virtual WAN Hub Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Security Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `bas` | Azure Bastion | WAF Assessment, Azure Principal Architect, Bastion Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `kvmhsm` | Key Vault Managed HSM | WAF Assessment, Azure Principal Architect, Key Vault HSM Best Practices, Resource Health Diagnosis, Cost Optimization |
| `id` | Managed identities | WAF Assessment, Azure Principal Architect, Managed Identity Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sshkey` | SSH keys | WAF Assessment, Azure Principal Architect, SSH Key Management Best Practices, Resource Health Diagnosis, Cost Optimization |
| `vpng` | VPN gateways | WAF Assessment, Azure Principal Architect, VPN Gateway Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vcn` | VPN connections | WAF Assessment, Azure Principal Architect, VPN Connection Best Practices, Resource Health Diagnosis, Cost Optimization |
| `vst` | VPN sites | WAF Assessment, Azure Principal Architect, VPN Site Best Practices, Resource Health Diagnosis, Cost Optimization |
| `waf` | Web Application Firewall | WAF Assessment, Azure Principal Architect, WAF Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `wafrg` | WAF rule groups | WAF Assessment, Azure Principal Architect, WAF Rule Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Storage Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `ssimp` | StorSimple | WAF Assessment, Azure Principal Architect, StorSimple Best Practices, Resource Health Diagnosis, Cost Optimization |
| `bvault` | Backup vaults | WAF Assessment, Azure Principal Architect, Backup Vault Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `bkpol` | Backup policies | WAF Assessment, Azure Principal Architect, Backup Policy Best Practices, Resource Health Diagnosis, Cost Optimization |
| `share` | File shares | WAF Assessment, Azure Principal Architect, File Share Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `st` | Storage accounts | WAF Assessment, Azure Principal Architect, Storage Account Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `sss` | Storage Sync services | WAF Assessment, Azure Principal Architect, Storage Sync Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |

#### Virtual Desktop Infrastructure Services

| CAF Abbrev | Service Type | Analysis Sections |
|------------|-------------|-------------------|
| `vdpool` | Virtual desktop host pools | WAF Assessment, Azure Principal Architect, Virtual Desktop Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization |
| `vdag` | Virtual desktop app groups | WAF Assessment, Azure Principal Architect, Virtual Desktop App Group Best Practices, Resource Health Diagnosis, Cost Optimization |
| `vdws` | Virtual desktop workspaces | WAF Assessment, Azure Principal Architect, Virtual Desktop Workspace Best Practices, Resource Health Diagnosis, Cost Optimization |
| `vdscaling` | Virtual desktop scaling plans | WAF Assessment, Azure Principal Architect, Virtual Desktop Scaling Best Practices, Resource Health Diagnosis, Cost Optimization |

#### Existing Implemented Types

| CAF Abbrev | Service Type | Analysis Sections | Status |
|------------|-------------|-------------------|---------|
| `aa` | Automation accounts | WAF Assessment, Azure Principal Architect, Automation Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `adf` | Data Factory | WAF Assessment, Azure Principal Architect, Data Factory Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Enhanced |
| `ag` | Action Groups | WAF Assessment, Azure Principal Architect, Action Group Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `apim` | API Management | WAF Assessment, Azure Principal Architect, API Management Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `app` | Web Apps | WAF Assessment, Azure Principal Architect, App Service Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `appi` | Application Insights | WAF Assessment, Azure Principal Architect, Application Insights Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `asp` | App Service Plans | WAF Assessment, Azure Principal Architect, App Service Plan Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `dcr` | Data Collection Rules | WAF Assessment, Azure Principal Architect, Data Collection Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `func` | Functions | WAF Assessment, Azure Principal Architect, Azure Functions TypeScript Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Enhanced |
| `kv` | Key Vaults | WAF Assessment, Azure Principal Architect, Key Vault Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `log` | Log Analytics | WAF Assessment, Azure Principal Architect, Log Analytics Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `logic` | Logic Apps | WAF Assessment, Azure Principal Architect, Azure Logic Apps and Power Automate Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ In Progress |
| `mg` | Management Groups | WAF Assessment, Azure Principal Architect, Management Group Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `rg` | Resource Groups | WAF Assessment, Azure Principal Architect, Resource Group Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `sbns` | Service Bus Namespaces | WAF Assessment, Azure Principal Architect, Service Bus Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `sbq` | Service Bus Queues | WAF Assessment, Azure Principal Architect, Service Bus Queue Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `sbt` | Service Bus Topics | WAF Assessment, Azure Principal Architect, Service Bus Topic Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `sbts` | Service Bus Subscriptions | WAF Assessment, Azure Principal Architect, Service Bus Subscription Best Practices, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
| `vm` | Virtual Machines | WAF Assessment, Azure Principal Architect, VM Best Practices, Terraform Infrastructure, Resource Health Diagnosis, Cost Optimization | ✅ Implemented |
