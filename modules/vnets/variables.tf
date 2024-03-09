variable "vnets" {
  description = "A list of virtual network specifications"
  type = list(object({
    name            = string
    address_space   = list(string)
    subnets         = list(object({
      name           = string
      address_prefix = string
    }))
  }))
}

variable "location" {
  description = "The Azure region where the virtual networks will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all virtual networks"
  type        = map(string)
}
