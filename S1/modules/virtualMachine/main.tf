resource "azurerm_network_interface" "network_interface" {
  for_each            = local.network_interfaces
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = each.value.public_ip_id
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machines" {
  for_each            = local.virtual_machines
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    element([for k, v in azurerm_network_interface.network_interface : v.id if k == "${each.value.nic_name}"], 0),
  ]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file("${var.path_to_publickey}")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
