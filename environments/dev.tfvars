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
    name     = "neubank-dev-rg-eastus-presentation"
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
    resource_group_name = "neubank-dev-rg"
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
    resource_group_name = "neubank-dev-rg"
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
    name          = "neubank-dev-vnet-eus-hub"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    address_space = ["10.0.1.0/24"]
    location      = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Project1",
      Owner       = "first.last@company.com" 
    }
    subnets       = [
      {
        name           = "subnet-unused"
        address_prefix = "10.0.1.0/24"
      }
    ]
  },
  {
    name          = "neubank-dev-vnet-eus-spoke-frontend"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    address_space = ["10.0.2.0/24"]
    location      = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
    subnets       = [
      {
        name           = "subnet-vnet-integration"
        address_prefix = "10.0.2.0/24"
      }
    ]
  },
    {
    name          = "neubank-dev-vnet-eus-spoke-application"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    address_space = ["10.0.3.0/24"]
    location      = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
    subnets       = [
      {
        name           = "subnet-ase-dedicated"
        address_prefix = "10.0.3.0/24"
      }
    ]
  },
    {
    name          = "neubank-dev-vnet-eus-spoke-privateendpoints"
    resource_group_name = "neubank-dev-rg-eastus-connectivity"
    address_space = ["10.0.4.0/24"]
    location      = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
    subnets       = [
      {
        name           = "subnet-privateendpoints-redis"
        address_prefix = "10.0.4.0/28"
      }
    ],
    subnets       = [
      {
        name           = "subnet-privateendpoints-sql"
        address_prefix = "10.0.4.16/28"
      }
    ],
    subnets       = [
      {
        name           = "subnet-privateendpoints-storage"
        address_prefix = "10.0.4.32/28"
      }
    ]
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

// Finish building this out
peerings = [
  {
    name                    = "neubank-dev-vnet1-to-vnet2-eastus"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet1"
    peer_vnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/neubank-dev-rg/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet2"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet1-to-vnet2-eastus"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet1"
    peer_vnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/neubank-dev-rg/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet2"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet1-to-vnet2-eastus"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet1"
    peer_vnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/neubank-dev-rg/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet2"
    allow_forwarded_traffic = true
    allow_vnet_access       = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  },
  {
    name                    = "neubank-dev-vnet1-to-vnet2-eastus"
    resource_group_name     = "neubank-dev-rg-eastus-connectivity"
    vnet_name               = "neubank-dev-vnet1"
    peer_vnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/neubank-dev-rg/providers/Microsoft.Network/virtualNetworks/neubank-dev-vnet2"
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

sql_databases = [
  {
    name             = "neubank-dev-sqlserver-eastus"
    resource_group_name = "neubank-dev-rg-eastus-data"
    location         = "East US"
    server_name      = "neubank-dev-sqlserver"
    database_name    = "neubank-dev-sqldb"
    sku_name         = "S0"
    max_size_gb      = 5
    tags = {
      Environment = "dev",
      Project     = "NeuBank Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
  }
]

// Application Layer (API) resources
ase = {
  name                        = "neubank-dev-ase-eastus"
  resource_group_name         = "neubank-dev-rg-eastus-presentation"
  subnet_id                   = "subnet_id_for_ase"  # Replace with the actual subnet ID
  pricing_tier                = "I1"
  front_end_scale_factor      = 10
  internal_load_balancing_mode = "Web, Publishing"
  tags = {
    Environment = "dev",
    Project     = "NeuBank Mortgage Calculator",
    Owner       = "first.last@company.com"
  }
}

// Presentation Layer (Front End) resources
app_services = [
  {
    name                = "neubank-dev-appservice-eastus"
    resource_group_name = "neubank-dev-rg-eastus-presentation"
    location            = "East US"
    tags          = { 
      Environment = "Dev", 
      Project     = "Mortgage Calculator",
      Owner       = "first.last@company.com"
    }
    app_service_plan_id = "neubank-dev-appsserviceplan-eastus"
    site_config         = {
        dotnet_framework_version = "v4.0"
    }
    app_settings       = {
       "APPINSIGHTS_INSTRUMENTATIONKEY" = "instrumentation_key_for_dev_eastus" // Replace with the actual key
    }
  }
]