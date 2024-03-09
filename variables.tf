variable "resource_group_names" {
  type        = list(string)
  description = "List of names for the Azure resource groups to be created."
}

variable "location" {
  type        = string
  description = "Azure region where the resource groups will be created."
}

variable "common_tags" {
  type        = map(string)
  description = "Common set of tags to be applied to all resource groups."
}

