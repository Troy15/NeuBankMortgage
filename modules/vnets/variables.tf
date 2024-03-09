variable "vnets" {
  description = "A list of virtual network specifications, each including its own location and tags"
  type = list(object({
    name          = string
    address_space = list(string)
    location      = string       
    tags          = map(string)  
    subnets       = list(object({
      name           = string
      address_prefix = string
    }))
  }))
}
