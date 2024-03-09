output "resource_group_ids" {
  value = { for rg in azurerm_resource_group.rg : rg.name => rg.id }
  description = "Map of resource group names to their respective Azure resource ID."
}
