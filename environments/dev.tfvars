// Resource groups for each tier plus one for connectivity resources
resource_groups = [
  {
    name     = "neubank-dev-rg-eastus-connectivity"
    location = "East US"
    tags     = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name     = "neubank-dev-rg-eastus-presentation"
    location = "East US"
    tags     = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name     = "neubank-dev-rg-eastus-application"
    location = "East US"
    tags     = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name     = "neubank-dev-rg-eastus-data"
    location = "East US"
    tags     = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

// Monitoring resoruces
application_insights = [
  {
    name                = "neubank-dev-appinsights-eastus-api"
    resource_group_name = "neubank-dev-rg-eastus-application"
    location            = "East US"
    application_type    = "web"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name                = "neubank-dev-appinsights-eastus-frontend"
    resource_group_name = "neubank-dev-rg-eastus-presentation"
    location            = "east US"
    application_type    = "web"
    tags                = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

// Networking resources
vnets = [
  {
    name                = "neubank-dev-vnet-eus-hub"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    address_space       = ["10.0.1.0/24"]
    tags                = {
      Environment = "Dev",
      Project     = "Project1",
      Owner       = "first.last@company.com"
    }
  },
  {
    name                = "neubank-dev-vnet-eus-spoke-frontend"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    address_space       = ["10.0.2.0/24"]
    tags                = {
      Environment = "Dev",
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name                = "neubank-dev-vnet-eus-spoke-application"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    address_space       = ["10.0.3.0/24"]
    tags                = {
      Environment = "Dev",
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  },
  {
    name                = "neubank-dev-vnet-eus-spoke-privateendpoints"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    address_space       = ["10.0.4.0/24"]
    tags                = {
      Environment = "Dev",
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

subnets = [
  {
    vnet_name           = "neubank-dev-vnet-eus-spoke-frontend"
    name                = "subnet-appservice-vnet-integration"
    address_prefixes    = ["10.0.2.0/24"]
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    delegations = [
      {
        name    = "serverFarmsDelegation"
        service = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/join/action"]
      }
    ]
  },
  {
    vnet_name           = "neubank-dev-vnet-eus-spoke-application"
    name                = "subnet-ase-dedicated"
    address_prefixes    = ["10.0.3.0/24"]
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    delegations = [
      {
        name    = "hostingEnvironmentsDelegation"
        service = "Microsoft.Web/hostingEnvironments"
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/join/action"]
      }
    ]
  },
  {
    vnet_name           = "neubank-dev-vnet-eus-spoke-privateendpoints"
    name                = "subnet-privateendpoints-redis"
    address_prefixes    = ["10.0.4.0/28"]
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
  },
  {
    vnet_name           = "neubank-dev-vnet-eus-spoke-privateendpoints"
    name                = "subnet-privateendpoints-sql"
    address_prefixes    = ["10.0.4.16/28"]
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
  },
  {
    vnet_name           = "neubank-dev-vnet-eus-spoke-privateendpoints"
    name                = "subnet-privateendpoints-storage"
    address_prefixes    = ["10.0.4.32/28"]
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
  }
]

nsgs = [
  {
    name                = "neubank-dev-nsg-eastus-subnet-integration"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    security_rules      = [
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  },  
  {
    name                = "neubank-dev-nsg-eastus-subnet-ase"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    security_rules      = [
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  },  
  {
    name                = "neubank-dev-nsg-eastus-subnet-privateendpoints-redis"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    security_rules      = [
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  },  
  {
    name                = "neubank-dev-nsg-eastus-subnet-privateendpoints-sql"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    security_rules      = [
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  },  
{
    name                = "neubank-dev-nsg-eastus-subnet-privateendpoints-storage"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    location            = "East US"
    security_rules      = [
      {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
]

// Peering configuration
// In an actual environment I wouldn't want to use the subscription ID hardcoded here, but for the sake of this example I'm doing so. 
peerings = [
  {
    name                    = "neubank-dev-vnet-eus-hub-TO-neubank-dev-vnet-eus-spoke-frontend"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-hub"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-spoke-frontend"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet-eus-hub-TO-neubank-dev-vnet-eus-spoke-application"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-hub"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-spoke-application"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet-eus-hub-TO-neubank-dev-vnet-eus-spoke-privateendpoints"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-hub"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-spoke-privateendpoints"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet-eus-spoke-frontend-TO-neubank-dev-vnet-eus-hub"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-spoke-frontend"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-hub"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet-eus-spoke-application-TO-neubank-dev-vnet-eus-hub"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-spoke-application"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-hub"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet-eus-spoke-privateendpoints-TO-neubank-dev-vnet-eus-hub"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet-eus-spoke-privateendpoints"
    peer_vnet_id            = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-hub"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  }
]

// Data Layer resources
blob_storages = [
    {
        name                     = "neubankdevstgeastus"
        resource_group_name      = "neubank-dev-rg-eastus-data"
        location                 = "East US"
        account_tier             = "Standard"
        account_replication_type = "LRS"
        account_kind             = "StorageV2" 
        access_tier              = "Hot"
        tags = {
                Environment = "dev",
                Project     = "NeuBank Mortgage Calculator",
                Owner       = "first.last@company.com"
        }
    }
]

redis_caches = [
  {
    name                = "neubank-dev-rediscache-eastus"
    resource_group_name = "neubank-dev-rg-eastus-data"
    location            = "East US"
    sku_name            = "Basic"  
    capacity            = 0  
    enable_non_ssl_port = false
    public_network_access_enabled = false
    family              = "C"
    tags     = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

sql_servers = [
  {
    name                         = "neubank-dev-sqlserver-eastus"
    resource_group_name          = "neubank-dev-rg-eastus-data"
    location                     = "East US"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "ComplexPassword!23"
    minimum_tls_version          = "1.2"
    tags = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

// Application Layer (API) resources
ase_v3 = {
  name                        = "neubank-dev-ase-eastus"
  resource_group_name         = "neubank-dev-rg-eastus-presentation"
  location              = "East US"
  subnet_id             = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-spoke-application/subnets/subnet-ase-dedicated"
  pricing_tier          = "IsolatedV3"
  zone_redundant        = false
    tags = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
}


// Presentation Layer (Front End) resources
app_service_plans = [
  {
    name                = "neubank-dev-asp-eastus"
    resource_group_name = "neubank-dev-rg-eastus-presentation"
    location            = "East US"
    os_type             = "Linux"
    sku_name            = "P1v2"
  }
]

linux_web_apps = [
  {
    name                = "neubank-dev-appservice-eastus"
    resource_group_name = "neubank-dev-rg-eastus-presentation"
    location            = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
    service_plan_id     = "neubank-dev-asp-eastus"
    subnet_id          = "/subscriptions/57a2f443-b4b6-4d30-8ec6-7cc6b09dda92/resourceGroups/neubank-dev-rg-eastus-connectivity/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet-eus-spoke-frontend/subnets/subnet-appservice-vnet-integration"
    site_config = {
      always_on        = true
    }
    app_settings       = {
       "APPINSIGHTS_INSTRUMENTATIONKEY" = "instrumentation_key_for_dev_eastus" // Replace with the actual key       
    }
  }
]