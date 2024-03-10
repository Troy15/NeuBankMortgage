resource "azurerm_virtual_network" "vnet" {
  for_each = {for vnet in var.vnets : vnet.name => vnet}

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  tags                = each.value.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = {for idx, vnet in var.vnets : idx => vnet for subnet in vnet.subnets : subnet.name => subnet}
  name                 = each.value.name
  resource_group_name  = each.key.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.key.name].name
  address_prefixes     = each.value.address_prefix
}
