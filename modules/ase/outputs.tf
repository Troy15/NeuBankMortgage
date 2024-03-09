output "ase_id" {
  value       = azurerm_app_service_environment.ase.id
  description = "The resource ID of the Azure App Service Environment."
}

output "ase_name" {
  value       = azurerm_app_service_environment.ase.name
  description = "The name of the Azure App Service Environment."
}
