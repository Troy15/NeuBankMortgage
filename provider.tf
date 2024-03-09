terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Specify the version you wish to use. Use the latest version compatible with your configuration.
    }
  }
  required_version = ">= 0.14" # Specify the minimum Terraform version required for your configuration.
}

provider "azurerm" {
  features {} # The features block is required by the Azure provider, but can be left empty.
  
  # Optionally, you can specify the subscription_id, client_id, client_secret, and tenant_id for specific scenarios.
  # subscription_id = "your-subscription-id"
  # client_id       = "your-client-id"
  # client_secret   = "your-client-secret"
  # tenant_id       = "your-tenant-id"
}
