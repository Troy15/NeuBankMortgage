resource "azurerm_virtual_network_peering" "peering" {
  count                     = length(var.peerings)
  name                      = var.peerings[count.index].name
  resource_group_name       = var.peerings[count.index].resource_group_name
  virtual_network_name      = var.peerings[count.index].vnet_name
  remote_virtual_network_id = var.peerings[count.index].peer_vnet_id
  allow_forwarded_traffic   = var.peerings[count.index].allow_forwarded_traffic
  allow_virtual_network_access = var.peerings[count.index].allow_vnet_access
  allow_gateway_transit     = var.peerings[count.index].allow_gateway_transit
  use_remote_gateways       = var.peerings[count.index].use_remote_gateways
}
