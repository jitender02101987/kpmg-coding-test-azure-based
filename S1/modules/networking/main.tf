resource "azurerm_virtual_network" "az_vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = local.resource_group_name
  address_space       = var.vnet_cidr
}

resource "azurerm_subnet" "subnets" {
  for_each             = local.subnets
  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
