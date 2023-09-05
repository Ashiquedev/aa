resource "azurerm_mssql_database" "sample_db" {
  name                 = var.mssql_config.azsql_db_name
  server_id            = azurerm_mssql_server.azsqlserver.id
  collation            = var.mssql_config.azsql_collation
  license_type         = var.mssql_config.azsql_licensetype
  max_size_gb          = var.mssql_config.max_size
  sku_name             = var.mssql_config.azsql_sku
  storage_account_type = var.mssql_config.sa_type
  sample_name          = var.mssql_config.db_sample
  zone_redundant       = false
  read_scale           = false
  depends_on = [
    azurerm_mssql_server.azsqlserver
  ]
}
