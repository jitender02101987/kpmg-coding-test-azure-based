resource "azurerm_network_security_group" "security_groups" {
  for_each            = local.network-security-groups
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.rules
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-association" {

  for_each                  = local.nsg-subnet-association
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id

}