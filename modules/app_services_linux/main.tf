resource "azurerm_service_plan" "plan" {
  for_each = { for plan in var.app_service_plans : plan.name => plan }

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_linux_web_app" "webapp" {
  for_each = { for webapp in var.linux_web_apps : webapp.name => webapp }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  service_plan_id     = azurerm_service_plan.plan[each.value.service_plan_id].id

  # Specify the ID of the subnet dedicated to the App Service for VNet Integration
  virtual_network_subnet_id    = each.value.subnet_id

  site_config {
    always_on             = each.value.site_config.always_on
    # Enable VNet Integration by routing all traffic through the VNet
    vnet_route_all_enabled = true 
  }

  app_settings = each.value.app_settings
}
