output "virtual_network_id" {
  value = azurerm_virtual_network.az_vnet.id
}

output "web_subnet_id" {
  value = element([for k, v in azurerm_subnet.subnets : v.id if k == "${var.websubnet_name}"], 0)
}

output "app_subnet_id" {
  value = element([for k, v in azurerm_subnet.subnets : v.id if k == "${var.appsubnet_name}"], 0)
}

output "db_subnet_id" {
  value = element([for k, v in azurerm_subnet.subnets : v.id if k == "${var.datasubnet_name}"], 0)
}
