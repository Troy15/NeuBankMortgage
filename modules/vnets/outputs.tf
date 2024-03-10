output "vnet_ids" {
  value       = {for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id}
  description = "Map of VNet names to their resource IDs."
}

output "subnet_ids" {
  value       = {for subnet in azurerm_subnet.subnet : subnet.name => subnet.id}
  description = "Map of Subnet names to their resource IDs."
}
