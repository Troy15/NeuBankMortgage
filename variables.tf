variable "app_service_plans" {
  description = "A list of App Service Plan specifications"
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
    subnet_id          = string  # Assuming direct VNet integration
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

variable "sql_servers" {
  description = "A list of Azure SQL Server specifications"
  type = list(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = map(string)
  }))
}

variable "vnets" {
  description = "A list of virtual network specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "subnets" {
  description = "A list of subnet specifications, including VNet association and optional delegation"
  type = list(object({
    vnet_name           = string
    name                = string
    address_prefixes    = list(string)
    resource_group_name = string
    delegations = optional(list(object({  # Note the change to 'delegations' as a list
      name    = string
      service = string
      actions = list(string)  # Assuming you might specify actions per delegation
    })))
  }))
}

variable "ase_v3" {
  description = "Configuration for Azure App Service Environment v3"
  type = object({
    name                  = string
    resource_group_name   = string
    location              = string
    subnet_id             = string
    pricing_tier          = string
    zone_redundant        = bool
    tags                  = map(string)
  })
}