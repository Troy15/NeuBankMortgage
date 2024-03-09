variable "app_services" {
  description = "A list of Azure App Service specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    app_service_plan_id = string
    site_config         = object({
      linux_fx_version = string
      always_on        = bool
    })
    app_settings       = map(string)
  }))
}
