#=====windowsm/c=======

variable "vm1_config" {
  type = object({
    vm_name               = string
    subnet_name           = string
    size                  = string
    username              = string
    pub_ip_name           = string
    pub_ip_alloacation    = string
    nic_name              = string
    private_ip_allocation = string
    vm1_nsg_name          = string
    cache                 = string
    sa_type               = string
    vm_size               = string
    publisher             = string
    offer                 = string
    sku                   = string
    version               = string
    computer_name         = string
    nic_ip_name           = string
  })
  default = {
    vm_name               = "vm1"
    subnet_name           = "subnet1"
    size                  = "Standard_B2ms"
    username              = "ashik"
    pub_ip_name           = "vm1_publicip"
    pub_ip_alloacation    = "Static"
    nic_name              = "windows-nic"
    private_ip_allocation = "Dynamic"
    vm1_nsg_name          = "windows_nsg"
    cache                 = "ReadWrite"
    sa_type               = "Standard_LRS"
    vm_size               = "Standard_B2ms"
    publisher             = "MicrosoftWindowsServer"
    offer                 = "WindowsServer"
    sku                   = "2016-Datacenter"
    version               = "latest"
    computer_name         = "vm1"
    nic_ip_name           = "vm1_nic_ip"
  }
}


resource "azurerm_public_ip" "vm1_publicip" {
  name                = var.vm1_config.pub_ip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.vm1_config.pub_ip_alloacation
}



resource "azurerm_network_interface" "nic" {
  name                = var.vm1_config.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.vm1_config.nic_ip_name
    subnet_id                     = data.azurerm_subnet.subnet1_name.id
    private_ip_address_allocation = var.vm1_config.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.vm1_publicip.id
  }
}

resource "azurerm_network_security_group" "vm1_nsg" {
  name                = var.vm1_config.vm1_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "vm1_nsg_to_subnet1" {
  subnet_id                 = data.azurerm_subnet.subnet1_name.id
  network_security_group_id = azurerm_network_security_group.vm1_nsg.id
}


resource "azurerm_network_security_rule" "vm1_nsg_rule" {
  name                        = local.nsg_rule_name
  priority                    = local.nsg_rule_priority
  direction                   = local.nsg_rule_direction
  access                      = local.nsg_rule_access
  protocol                    = local.nsg_rule_protocol
  source_port_range           = local.nsg_rule_source_port_range
  destination_port_range      = local.nsg_rule_destination_port_range
  source_address_prefix       = local.nsg_rule_source_address_prefix
  destination_address_prefix  = data.azurerm_subnet.subnet1_name.address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.vm1_nsg.name
}




resource "azurerm_windows_virtual_machine" "vm1" {
  name                = var.vm1_config.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm1_config.vm_size
  computer_name       = var.vm1_config.computer_name
  admin_username      = var.vm1_config.username
  admin_password      = azurerm_key_vault_secret.vm_password.value

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = var.vm1_config.cache
    storage_account_type = var.vm1_config.sa_type
  }

  source_image_reference {
    publisher = var.vm1_config.publisher
    offer     = var.vm1_config.offer
    sku       = var.vm1_config.sku
    version   = var.vm1_config.version
  }
  depends_on = [
    azurerm_key_vault_secret.vm_password
  ]
}



