//Replacement App Service module for Linux
module "app_services_linux" {
  source           = "./modules/app_services_linux"
  linux_web_apps   = var.linux_web_apps
  app_service_plans = var.app_service_plans
  depends_on = [module.resource_groups]
}

//App Service Environment module
module "ase_v3" {
  source = "./modules/ase_v3"
  ase_v3    = var.ase_v3
  depends_on = [module.resource_groups, module.vnets]
}

// Blob Storage module
module "blob_storage" {
  source        = "./modules/blob_storage"
  blob_storages = var.blob_storages
  depends_on = [module.resource_groups]
}

// AppInisghts module
module "monitoring" {
  source                = "./modules/monitoring"
  application_insights  = var.application_insights
  depends_on = [module.resource_groups]
}

// Network Security Group (NSG) module
module "nsgs" {
  source      = "./modules/nsgs"
  nsgs        = var.nsgs
  depends_on = [module.resource_groups, module.vnets]
}

// VNet peering module
module "peering" {
  source      = "./modules/peering"
  peerings    = var.peerings
  depends_on = [module.resource_groups, module.vnets]
}

// Redis Cache module
module "redis_cache" {
  source        = "./modules/redis_cache"
  redis_caches  = var.redis_caches
  depends_on = [module.resource_groups]
}

module "resource_groups" {
  source          = "./modules/resource_groups"
  resource_groups = var.resource_groups
}

// Azure SQL Database module
module "sql_db" {
  source        = "./modules/sql_db"
  sql_servers = var.sql_servers
  depends_on = [module.resource_groups]
}

// Virtual Network module
module "vnets" {
  source      = "./modules/vnets"
  vnets       = var.vnets
  subnets     = var.subnets
  depends_on = [module.resource_groups]
}