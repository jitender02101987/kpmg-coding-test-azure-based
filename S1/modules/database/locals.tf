locals {
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.az_mysql_server.name
}