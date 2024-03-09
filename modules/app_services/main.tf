resource "azurerm_app_service" "app" {
  count               = length(var.app_services)
  name                = var.app_services[count.index].name
  location            = var.app_services[count.index].location
  resource_group_name = var.app_services[count.index].resource_group_name
  app_service_plan_id = var.app_services[count.index].app_service_plan_id

  site_config {
    linux_fx_version = var.app_services[count.index].site_config.linux_fx_version
    always_on        = var.app_services[count.index].site_config.always_on
  }

  app_settings = var.app_services[count.index].app_settings
}
