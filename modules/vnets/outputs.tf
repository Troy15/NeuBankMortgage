output "vnet_ids" {
  value = {for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id}
  description = "The IDs of the created virtual networks."
}

output "subnet_ids" {
  value = {for subnet in azurerm_subnet.subnet : subnet.name => subnet.id}
  description = "The IDs of the created subnets."
}
