resource "azurerm_private_dns_zone" "azsql-private-dns" {
  name                = var.sql_dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "azsql-private-dns-link" {
  name                  = "dnslink-vnet"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.azsql-private-dns.name
  virtual_network_id    = azurerm_virtual_network.vnetdb.id
}

#
## Create a DB Private DNS A Record
#resource "azurerm_private_dns_a_record" "dbendpoint-dns-a-record" {
#  depends_on          = [azurerm_mssql_server.azsqlserver]
#  name                = lower(azurerm_mssql_server.azsqlserver.name)
#  zone_name           = azurerm_private_dns_zone.azsql-endpoint-dns-private-zone.name
#  resource_group_name = azurerm_resource_group.rg.name
#  ttl                 = 300
#  records             = [data.azurerm_private_endpoint_connection.azsql-endpoint-connection.private_service_connection.0.private_ip_address]
#}
#

