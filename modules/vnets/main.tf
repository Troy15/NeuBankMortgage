resource "azurerm_virtual_network" "vnet" {
  count             = length(var.vnets)
  name              = var.vnets[count.index].name
  address_space     = var.vnets[count.index].address_space
  location          = var.vnets[count.index].location  
  tags              = var.vnets[count.index].tags      

  resource_group_name = var.resource_group_name  

  dynamic "subnet" {
    for_each = var.vnets[count.index].subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}
