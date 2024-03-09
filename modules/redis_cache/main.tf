resource "azurerm_redis_cache" "redis" {
  count               = length(var.redis_caches)
  name                = var.redis_caches[count.index].name
  location            = var.redis_caches[count.index].location
  resource_group_name = var.redis_caches[count.index].resource_group_name
  capacity            = var.redis_caches[count.index].capacity
  sku_name            = var.redis_caches[count.index].sku_name
  family              = var.redis_caches[count.index].family
  public_network_access_enabled = var.redis_caches[count.index].public_network_access_enabled
  enable_non_ssl_port = var.redis_caches[count.index].enable_non_ssl_port
  tags                = var.redis_caches[count.index].tags
}
