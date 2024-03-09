variable "ase" {
  description = "Specifications for the Azure App Service Environment"
  type = object({
    name                 = string
    resource_group_name  = string
    subnet_id            = string
    pricing_tier         = string
    front_end_scale_factor = number
    internal_load_balancing_mode = string
    tags                 = map(string)
  })
}
