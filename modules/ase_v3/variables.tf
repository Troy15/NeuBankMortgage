variable "ase_v3" {
  description = "Configuration for Azure App Service Environment v3"
  type = object({
    name                  = string
    resource_group_name   = string
    subnet_id             = string
    tags                  = map(string)
  })
}
