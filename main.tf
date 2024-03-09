module "app_services" {
  source          = "./modules/app_services"
  app_services    = var.app_services
}

module "ase" {
  source      = "./modules/ase"
  ase         = var.ase
}

module "blob_storage" {
  source        = "./modules/blob_storage"
  blob_storages = var.blob_storages
}

module "monitoring" {
  source                = "./modules/monitoring"
  application_insights  = var.application_insights
}

module "nsgs" {
  source      = "./modules/nsgs"
  nsgs        = var.nsgs
}

module "peering" {
  source      = "./modules/peering"
  peerings    = var.peerings
}

module "redis_cache" {
  source        = "./modules/redis_cache"
  redis_caches  = var.redis_caches
}

module "resource_groups" {
  source          = "./modules/resource_groups"
  resource_groups = var.resource_groups
}

module "sql_db" {
  source        = "./modules/sql_db"
  sql_databases = var.sql_databases
}

module "vnets" {
  source      = "./modules/vnets"
  vnets       = var.vnets
}