locals {
  resource_group_name = var.rg_name
  location            = var.location

  network-security-groups = {
    "${var.web_nsg_name}" = {
      location            = local.location
      resource_group_name = local.resource_group_name
      rules = {
        "Allow-inbound-all" = {
          direction                  = "Inbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "0.0.0.0/0"
          destination_address_prefix = "10.0.1.0/24"
        }

        "Allow-outbound-all" = {
          direction                  = "Outbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "10.0.1.0/24"
          destination_address_prefix = "*"
        }
      }
    }

    "${var.app_nsg_name}" = {
      location            = local.location
      resource_group_name = local.resource_group_name
      rules = {
        "Allow-inbound-web-all" = {
          direction                  = "Inbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "10.0.1.0/24"
          destination_address_prefix = "10.0.2.0/24"
        }
        "Allow-outbound-web-all" = {
          direction                  = "Outbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "10.0.2.0/24"
          destination_address_prefix = "10.0.1.0/24"
        }
        "Allow-outbound-db-all" = {
          direction                  = "Outbound"
          access                     = "Allow"
          priority                   = 101
          source_address_prefix      = "10.0.2.0/24"
          destination_address_prefix = "10.0.3.0/24"
        }
        "Allow-inbound-db-all" = {
          direction                  = "Inbound"
          access                     = "Allow"
          priority                   = 101
          source_address_prefix      = "10.0.3.0/24"
          destination_address_prefix = "10.0.2.0/24"
        }
      }
    }

    "${var.db_nsg_name}" = {
      location            = local.location
      resource_group_name = local.resource_group_name
      rules = {
        "Allow-inbound-app-all" = {
          direction                  = "Inbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "10.0.2.0/24"
          destination_address_prefix = "10.0.3.0/24"
        }

        "Allow-outbound-app-all" = {
          direction                  = "Outbound"
          access                     = "Allow"
          priority                   = 100
          source_address_prefix      = "10.0.3.0/24"
          destination_address_prefix = "10.0.2.0/24"
        }
      }
    }
  }

  nsg-subnet-association = {
    "web-subnet-association" = {
      subnet_id                 = var.web_subnet_id
      network_security_group_id = element([for k, v in azurerm_network_security_group.security_groups : v.id if k == "${var.web_nsg_name}"], 0)
    }
    "app-subnet-association" = {
      subnet_id                 = var.app_subnet_id
      network_security_group_id = element([for k, v in azurerm_network_security_group.security_groups : v.id if k == "${var.app_nsg_name}"], 0)
    }
    "db-subnet-association" = {
      subnet_id                 = var.db_subnet_id
      network_security_group_id = element([for k, v in azurerm_network_security_group.security_groups : v.id if k == "${var.db_nsg_name}"], 0)
    }
  }
}