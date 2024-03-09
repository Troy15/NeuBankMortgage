output "app_service_ids" {
  value = { for app in azurerm_app_service.app : app.name => app.id }
  description = "Map of Azure App Service names to their respective Azure resource ID."
}
