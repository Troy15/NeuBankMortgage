variable "app_service_plans" {
  description = "Specifications for Azure App Service Plans"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    os_type             = string
    sku_name            = string
  }))
}

variable "linux_web_apps" {
  description = "A list of Azure Linux Web App specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    service_plan_id     = string
    site_config         = object({
      always_on        = bool
    })
    app_settings       = map(string)
  }))
}

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

variable "blob_storages" {
  description = "A list of Azure Blob Storage specifications"
  type = list(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string
    access_tier              = string
    tags                     = map(string)
  }))
}

variable "nsgs" {
  description = "A list of NSG specifications"
  type = list(object({
    name               = string
    resource_group_name = string
    location           = string
    security_rules     = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "peerings" {
  description = "A list of VNet peering specifications"
  type = list(object({
    name              = string
    resource_group_name = string
    vnet_name         = string
    peer_vnet_id      = string
    allow_forwarded_traffic = bool
    allow_vnet_access = bool
    allow_gateway_transit = bool
    use_remote_gateways = bool
  }))
}

variable "redis_caches" {
  description = "A list of Azure Redis Cache specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    sku_name            = string
    capacity            = number
    enable_non_ssl_port = bool
    public_network_access_enabled = bool
    family              = string
        tags                = map(string)
  }))
}

variable "resource_groups" {
  description = "A list of resource group specifications"
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "sql_databases" {
  description = "A list of Azure SQL Database specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    server_name         = string
    database_name       = string
    sku_name            = string
    max_size_gb         = number
    tags                = map(string)
  }))
}

variable "vnets" {
  description = "A list of virtual network specifications, each including subnets"
  type = list(object({
    name              = string
    resource_group_name = string
    location          = string
    address_space     = list(string)
    tags              = map(string)
    subnets           = list(object({
      name           = string
      address_prefix = list(string)
    }))
  }))
}


