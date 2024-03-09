variable "resource_group_names" {
  description = "A list of names for the resource groups to be created"
  type        = list(string)
}

variable "location" {
  description = "The Azure region where the resource groups will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all resource groups"
  type        = map(string)
}
