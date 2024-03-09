variable "resource_groups" {
  description = "A list of resource group specifications"
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}