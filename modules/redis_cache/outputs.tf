output "redis_cache_ids" {
  value = { for redis in azurerm_redis_cache.redis : redis.name => redis.id }
  description = "Map of Azure Redis Cache names to their respective Azure resource ID."
}
