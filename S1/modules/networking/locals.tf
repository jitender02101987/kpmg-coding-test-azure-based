locals {
  resource_group_name = var.rg_name

  subnets = {
    "${var.websubnet_name}" = {
      resource_group_name  = local.resource_group_name
      virtual_network_name = azurerm_virtual_network.az_vnet.name
      address_prefixes     = var.web_subnet_cidr
    }

    "${var.appsubnet_name}" = {
      resource_group_name  = local.resource_group_name
      virtual_network_name = azurerm_virtual_network.az_vnet.name
      address_prefixes     = var.app_subnet_cidr
    }

    "${var.datasubnet_name}" = {
      resource_group_name  = local.resource_group_name
      virtual_network_name = azurerm_virtual_network.az_vnet.name
      address_prefixes     = var.data_subnet_cidr
    }
  }
}