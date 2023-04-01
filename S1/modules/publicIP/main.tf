resource "azurerm_public_ip" "az_public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.ip_allocation_method
}