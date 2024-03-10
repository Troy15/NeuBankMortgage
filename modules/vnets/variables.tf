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
    delegations = optional(list(object({  # Note the change to 'delegations' as a list
      name    = string
      service = string
      actions = list(string)  # Assuming you might specify actions per delegation
    })))
  }))
}