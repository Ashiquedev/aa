resource "azurerm_subnet" "subnet" {
  count                                          = length(var.subnet_names)
  name                                           = var.subnet_names[count.index]
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = var.vnet_name
  service_endpoints                              = var.endpoints_subnet && count.index == 0 ? ["Microsoft.Sql"] : []
  enforce_private_link_service_network_policies  = var.endpoints_subnet && count.index == 0 ? true : false
  enforce_private_link_endpoint_network_policies = var.endpoints_subnet && count.index == 0 ? false : true
  address_prefixes                               = [cidrsubnet(var.network_range, 8, count.index)]
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnetdb
  ]
}
