#=====sqldatabaseserver====

resource "azurerm_mssql_server" "azsqlserver" {
  name                          = var.sql_server_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  version                       = var.azsql_version
  administrator_login           = var.sql_server_username
  administrator_login_password  = var.sql_server_password
  connection_policy             = var.sql_connection_policy
  public_network_access_enabled = var.sql_public_access

  depends_on = [
    azurerm_resource_group.rg
  ]
}