resource "azurerm_virtual_network" "vnet" {
  for_each            = {for vnet in var.vnets : vnet.name => vnet}

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  tags                = each.value.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = {for subnet in var.subnets : "${subnet.vnet_name}-${subnet.name}" => subnet}

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
}

