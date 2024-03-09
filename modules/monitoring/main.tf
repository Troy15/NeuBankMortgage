resource "azurerm_application_insights" "appinsights" {
  count               = length(var.application_insights)
  name                = var.application_insights[count.index].name
  location            = var.application_insights[count.index].location
  resource_group_name = var.application_insights[count.index].resource_group_name
  application_type    = var.application_insights[count.index].application_type
  tags                = var.application_insights[count.index].tags
}
