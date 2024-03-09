output "vnet_ids" {
  value = { for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id }
  description = "Map of virtual network names to their respective Azure resource ID."
}

output "subnet_ids" {
  value = { for vnet in azurerm_virtual_network.vnet : vnet.name => { for subnet in vnet.subnets : subnet.name => subnet.id } }
  description = "Map of subnet names to their respective Azure resource ID, organized by virtual network."
}
