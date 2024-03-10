//This might be a little sloppy, but I'm struggling to figure out a better way to pass the subnet_id to the ase module
locals {
  ase_configuration = {
    name                        = "neubank-dev-ase-eastus"
    resource_group_name         = "neubank-dev-rg-eastus-presentation"
    location                    = "eastus"
    subnet_id                   = module.vnets.subnet_ids["subnet-ase-dedicated"]
    pricing_tier                = "I1"
    front_end_scale_factor      = 10
    internal_load_balancing_mode = "Web, Publishing"
    tags = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
}

//Replacement App Service module for Linux
module "app_services_linux" {
  source           = "./modules/app_services_linux"
  linux_web_apps   = var.linux_web_apps
  app_service_plans = var.app_service_plans
}

//App Service Environment module
module "ase" {
  source = "./modules/ase"
  ase    = local.ase_configuration
}

// Blob Storage module
module "blob_storage" {
  source        = "./modules/blob_storage"
  blob_storages = var.blob_storages
}

// AppInisghts module
module "monitoring" {
  source                = "./modules/monitoring"
  application_insights  = var.application_insights
}

// Network Security Group (NSG) module
module "nsgs" {
  source      = "./modules/nsgs"
  nsgs        = var.nsgs
}

// VNet peering module
module "peering" {
  source      = "./modules/peering"
  peerings    = var.peerings
}

// Redis Cache module
module "redis_cache" {
  source        = "./modules/redis_cache"
  redis_caches  = var.redis_caches
}

module "resource_groups" {
  source          = "./modules/resource_groups"
  resource_groups = var.resource_groups
}

// Azure SQL Database module
module "sql_db" {
  source        = "./modules/sql_db"
  sql_databases = var.sql_databases
}

// Virtual Network module
module "vnets" {
  source      = "./modules/vnets"
  vnets       = var.vnets
}