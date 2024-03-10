variable "app_service_plans" {
  description = "A list of App Service Plan specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    os_type             = string
    sku_name            = string
  }))
}

variable "linux_web_apps" {
  description = "A list of Azure Linux Web App specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    service_plan_id     = string
    site_config         = object({
      always_on        = bool
    })
    app_settings       = map(string)
    subnet_id          = string  # Assuming direct VNet integration
  }))
}