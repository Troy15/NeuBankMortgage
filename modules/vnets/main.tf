provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnets)
  name                = var.vnets[count.index].name
  location            = var.location
  address_space       = var.vnets[count.index].address_space
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "subnet" {
    for_each = var.vnets[count.index].subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}
