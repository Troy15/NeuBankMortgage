variable "vnets" {
  description = "A list of virtual network specifications, each including subnets"
  type = list(object({
    name              = string
    resource_group_name = string
    location          = string
    address_space     = list(string)
    tags              = map(string)
    subnets           = list(object({
      name           = string
      address_prefix = list(string)
    }))
  }))
}
