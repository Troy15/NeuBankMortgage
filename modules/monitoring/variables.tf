variable "application_insights" {
  description = "A list of Application Insights specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    application_type    = string
    tags                = map(string)
  }))
}
