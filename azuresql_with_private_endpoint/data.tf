data "azurerm_subnet" "subnet1_name" {
  name                 = var.vm1_config.subnet_name
  virtual_network_name = azurerm_virtual_network.vnetdb.name
  resource_group_name  = azurerm_resource_group.rg.name
  depends_on           = [azurerm_subnet.subnet]
}

data "azurerm_subnet" "subnet2_name" {
  name                 = var.mssql_config.subnet_name
  virtual_network_name = azurerm_virtual_network.vnetdb.name
  resource_group_name  = azurerm_resource_group.rg.name
  depends_on           = [azurerm_subnet.subnet]
}


data "azurerm_private_endpoint_connection" "azsql-endpoint-connection" {
  depends_on          = [azurerm_private_endpoint.dbendpoint]
  name                = azurerm_private_endpoint.dbendpoint.name
  resource_group_name = azurerm_resource_group.rg.name
}