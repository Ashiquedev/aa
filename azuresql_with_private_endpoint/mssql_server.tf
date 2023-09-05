resource "azurerm_mssql_server" "azsqlserver" {
  name                          = var.sql_server_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  version                       = var.azsql_version
  administrator_login           = "ashik"
  administrator_login_password  = azurerm_key_vault_secret.vm_password.value
  connection_policy             = var.sql_connection_policy
  public_network_access_enabled = var.sql_public_access

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_windows_virtual_machine.vm1
  ]
}