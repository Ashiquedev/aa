resource "azurerm_virtual_network" "vnetdb" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.network_range]
  location            = azurerm_resource_group.rg.location
  depends_on = [
    azurerm_resource_group.rg
  ]
}