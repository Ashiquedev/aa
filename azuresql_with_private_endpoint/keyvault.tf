data "azurerm_client_config" "cred_current" {}

resource "azurerm_key_vault" "keys" {
  name                            = "vm-sql-keyvault"
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  enabled_for_disk_encryption     = true
  tenant_id                       = data.azurerm_client_config.cred_current.tenant_id
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  access_policy {
    tenant_id = data.azurerm_client_config.cred_current.tenant_id
    object_id = data.azurerm_client_config.cred_current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_key_vault_secret" "vm_password" {
  name         = "windowspassword"
  value        = "Ashik@091431"
  key_vault_id = azurerm_key_vault.keys.id
  depends_on = [
    azurerm_key_vault.keys
  ]
}


resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sqlpassword"
  value        = "Ashik@091431"
  key_vault_id = azurerm_key_vault.keys.id
  depends_on = [
    azurerm_key_vault.keys
  ]
}