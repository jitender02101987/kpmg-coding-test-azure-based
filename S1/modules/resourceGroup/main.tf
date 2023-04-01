resource "azurerm_resource_group" "azresourcegroup" {
  name     = var.rgname
  location = var.rglocation
}