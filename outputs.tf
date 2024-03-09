output "app_service_ids" {
  value = { for app in azurerm_app_service.app : app.name => app.id }
  description = "Map of Azure App Service names to their respective Azure resource ID."
}

output "application_insights_instrumentation_keys" {
  value = { for ai in azurerm_application_insights.appinsights : ai.name => ai.instrumentation_key }
  description = "Map of Application Insights names to their respective instrumentation keys."
}

output "ase_id" {
  value       = azurerm_app_service_environment.ase.id
  description = "The resource ID of the Azure App Service Environment."
}

output "ase_name" {
  value       = azurerm_app_service_environment.ase.name
  description = "The name of the Azure App Service Environment."
}

output "blob_storage_account_ids" {
  value = { for blob in azurerm_storage_account.blob : blob.name => blob.id }
  description = "Map of Azure Blob Storage account names to their respective Azure resource ID."
}

output "nsg_ids" {
  value = { for nsg in azurerm_network_security_group.nsg : nsg.name => nsg.id }
  description = "Map of NSG names to their respective Azure resource ID."
}

output "peering_ids" {
  value = { for peering in azurerm_virtual_network_peering.peering : peering.name => peering.id }
  description = "Map of VNet peering names to their respective Azure resource ID."
}

output "redis_cache_ids" {
  value = { for redis in azurerm_redis_cache.redis : redis.name => redis.id }
  description = "Map of Azure Redis Cache names to their respective Azure resource ID."
}

output "resource_group_ids" {
  value = module.resource_groups.resource_group_ids
}

output "sql_server_ids" {
  value = { for sql_server in azurerm_sql_server.sql_server : sql_server.name => sql_server.id }
  description = "Map of SQL Server names to their respective Azure resource ID."
}

output "sql_database_ids" {
  value = { for sql_db in azurerm_sql_database.sql_db : sql_db.name => sql_db.id }
  description = "Map of SQL Database names to their respective Azure resource ID."
}

output "vnet_ids" {
  value = { for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id }
  description = "Map of virtual network names to their respective Azure resource ID."
}

output "subnet_ids" {
  value = { for vnet in azurerm_virtual_network.vnet : vnet.name => { for subnet in vnet.subnets : subnet.name => subnet.id } }
  description = "Map of subnet names to their respective Azure resource ID, organized by virtual network."
}

