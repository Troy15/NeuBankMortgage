resource "azurerm_resource_group" "rg" {
  count      = length(var.resource_groups)
  name       = var.resource_groups[count.index].name
  location   = var.resource_groups[count.index].location
  tags       = var.resource_groups[count.index].tags
}
