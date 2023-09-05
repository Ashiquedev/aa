#======backend==================

terraform {
  backend "azurerm" {
    resource_group_name  = var.backend_config.resource_group_name
    storage_account_name = var.backend_config.storage_account_name
    container_name       = var.backend_config.container_name
    key                  = var.backend_config.key
    access_key           = var.backend_access_key
  }
}