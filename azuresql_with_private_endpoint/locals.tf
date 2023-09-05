locals {
  nsg_rule_name                   = "vm1_nsg_rule_allowRDP"
  nsg_rule_priority               = 300
  nsg_rule_direction              = "Inbound"
  nsg_rule_access                 = "Allow"
  nsg_rule_protocol               = "Tcp"
  nsg_rule_source_port_range      = "*"
  nsg_rule_destination_port_range = 3389
  nsg_rule_source_address_prefix  = "Internet"
}











