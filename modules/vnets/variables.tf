variable "vnets" {
  description = "A list of virtual network specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "subnets" {
  description = "A list of subnet specifications, including VNet association and optional delegation"
  type = list(object({
    vnet_name           = string
    name                = string
    address_prefixes    = list(string)
    resource_group_name = string
    delegation = optional(object({  # Make delegation optional
      name    = string
      service = string
    }))
  }))
}
