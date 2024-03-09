output "application_insights_instrumentation_keys" {
  value       = { for ai in azurerm_application_insights.appinsights : ai.name => ai.instrumentation_key }
  description = "Map of Application Insights names to their respective instrumentation keys."
}
