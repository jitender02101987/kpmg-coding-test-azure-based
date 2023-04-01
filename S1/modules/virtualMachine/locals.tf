locals {
  location            = var.location
  resource_group_name = var.rg_name
  vm_size             = var.vm_size
  admin_user          = var.vm_adminuser
  web_nic_name        = "${var.web_vm_name}-nic"
  app_nic_name        = "${var.app_vm_name}-nic"

  network_interfaces = {
    "${local.web_nic_name}" = {
      location                      = local.location
      resource_group_name           = local.resource_group_name
      subnet_id                     = var.web_subnet_id
      private_ip_address_allocation = var.ip_allocation_method
      public_ip_id                  = var.web_publicip_id
      name                          = "web-server"
    }
    "${local.app_nic_name}" = {
      location                      = local.location
      resource_group_name           = local.resource_group_name
      subnet_id                     = var.app_subnet_id
      private_ip_address_allocation = var.ip_allocation_method
      public_ip_id                  = null
      name                          = "app-server"
    }
  }

  virtual_machines = {
    "${var.web_vm_name}" = {
      resource_group_name = local.resource_group_name
      location            = local.location
      size                = local.vm_size
      admin_username      = local.admin_user
      nic_name            = local.web_nic_name
    }
    "${var.app_vm_name}" = {
      resource_group_name = local.resource_group_name
      location            = local.location
      size                = local.vm_size
      admin_username      = local.admin_user
      nic_name            = local.app_nic_name
    }
  }
}