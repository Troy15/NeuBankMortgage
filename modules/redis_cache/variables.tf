variable "redis_caches" {
  description = "A list of Azure Redis Cache specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    sku_name            = string
    capacity            = number
    enable_non_ssl_port = bool
    redis_version       = string
    tags                = map(string)
  }))
}
