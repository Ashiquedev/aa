resource "azurerm_private_endpoint" "dbendpoint" {
  name                = var.p_ep_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.subnet2_name.id
  private_service_connection {
    name                           = "azsql-privateserviceconnection"
    private_connection_resource_id = azurerm_mssql_server.azsqlserver.id
    is_manual_connection           = false
    subresource_names              = var.p_ep_subresource
  }
  depends_on = [
    azurerm_mssql_server.azsqlserver

  ]
}

