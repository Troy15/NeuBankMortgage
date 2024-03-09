terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.56.0"
    }
  }

# In a real-world scenario this would be configured to store the state file in an azure storage account. (Or could be stored elsewhere.)
  # backend "azurerm" {
  #  resource_group_name   = "YourResourceGroupName"
  #  storage_account_name  = "yourstorageaccountname"
  #  container_name        = "terraformstate"
  #  key                   = "terraform.tfstate"
  #}
}

provider "azurerm" {
  features {} # The azurerm provider uses a feature block to enable/disable certain features
}
