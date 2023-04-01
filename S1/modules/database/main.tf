resource "azurerm_mysql_server" "az_mysql_server" {
  name                         = var.mysql_dbserver_name
  location                     = var.location
  resource_group_name          = local.resource_group_name
  version                      = var.mysql_server_version
  administrator_login          = var.db_admin
  administrator_login_password = var.db_pass
  sku_name                     = var.db_sku
  ssl_enforcement_enabled      = true
}

resource "azurerm_mysql_database" "example" {
  name                = var.mysql_db_name
  resource_group_name = local.resource_group_name
  server_name         = local.server_name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
