provider "azurerm" {
  features {}
}

# Data source to retrieve an existing resource group
data "azurerm_resource_group" "example" {
  name = "your-resource-group-name"
}

# Azure Key Vault resource
resource "azurerm_key_vault" "example" {
  name                        = "example-keyvault"
  location                    = "West Europe"  # Specify your desired Azure region
  resource_group_name         = data.azurerm_resource_group.example.name
  sku_name                    = "standard"  # Specify the SKU name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7

  tags = {
    environment = "dev"
  }
}

data "azurerm_client_config" "current" {}