output "peering_ids" {
  value = { for peering in azurerm_virtual_network_peering.peering : peering.name => peering.id }
  description = "Map of VNet peering names to their respective Azure resource ID."
}
