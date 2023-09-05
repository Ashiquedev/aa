resource "azurerm_mssql_database" "test" {
  name                 = var.azsql_db_name
  server_id            = azurerm_mssql_server.azsqlserver.id
  collation            = var.azsql_collation
  license_type         = var.azsql_licensetype
  max_size_gb          = var.max_size
  sku_name             = var.azsql_sku
  storage_account_type = var.sa_type
  sample_name          = var.db_sample
  depends_on = [
    azurerm_mssql_server.azsqlserver
  ]
}


resource "azurerm_mssql_firewall_rule" "sql_firewall_rule" {
  name             = var.sql_firewall_rule_name
  server_id        = azurerm_mssql_server.azsqlserver.id
  start_ip_address = var.sql_client_ip[0]
  end_ip_address   = var.sql_client_ip[0]

  depends_on = [
    azurerm_mssql_database.test
  ]
}