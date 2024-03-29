resource "azurerm_network_security_group" "nsg" {
  count               = length(var.nsgs)
  name                = var.nsgs[count.index].name
  location            = var.nsgs[count.index].location
  resource_group_name = var.nsgs[count.index].resource_group_name

  dynamic "security_rule" {
    for_each = var.nsgs[count.index].security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}
