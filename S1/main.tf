module "resourcegroup" {
  source     = "./modules/resourceGroup/"
  rgname     = "${local.name_prefix}-rg-${local.tfsuffix}"
  rglocation = local.location
}

module "networking" {
  source           = "./modules/networking"
  vnet_name        = "${local.name_prefix}-vnet-${local.tfsuffix}"
  vnet_location    = local.location
  rg_name          = local.resource_group_name
  vnet_cidr        = var.vnet_cidr
  websubnet_name   = var.websubnet_name
  appsubnet_name   = var.appsubnet_name
  datasubnet_name  = var.datasubnet_name
  web_subnet_cidr  = var.web_subnet_cidr
  app_subnet_cidr  = var.app_subnet_cidr
  data_subnet_cidr = var.data_subnet_cidr
}

module "public_ip" {
  source               = "./modules/publicIP"
  rg_name              = local.resource_group_name
  location             = local.location
  ip_allocation_method = local.ip_allocation_method
  public_ip_name       = "${local.name_prefix}-publicIP-${local.tfsuffix}"
}

module "network_security_group" {
  source        = "./modules/securityGroup"
  app_nsg_name  = "${local.name_prefix}-appnsg-${local.tfsuffix}"
  web_nsg_name  = "${local.name_prefix}-webnsg-${local.tfsuffix}"
  db_nsg_name   = "${local.name_prefix}-dbnsg-${local.tfsuffix}"
  location      = local.location
  rg_name       = local.resource_group_name
  app_subnet_id = local.app_subnet_id
  web_subnet_id = local.web_subnet_id
  db_subnet_id  = local.db_subnet_id
}

module "database" {
  source               = "./modules/database"
  mysql_dbserver_name  = "${local.name_prefix}-mysqldbserver-${local.tfsuffix}"
  mysql_db_name        = "${local.name_prefix}-mysqldb-${local.tfsuffix}"
  db_networkrule_name  = "${local.name_prefix}-mysql-networkrule-${local.tfsuffix}"
  location             = local.location
  rg_name              = local.resource_group_name
  mysql_server_version = var.mysql_server_version
  db_admin             = var.mysql_db_admin
  db_pass              = var.mysql_db_pass
  db_sku               = var.mysql_db_sku
  db_subnet_id         = local.db_subnet_id
}

module "compute" {
  source               = "./modules/virtualMachine"
  web_vm_name          = "${local.name_prefix}-webvm-${local.tfsuffix}"
  app_vm_name          = "${local.name_prefix}-appvm-${local.tfsuffix}"
  vm_size              = local.vm_size
  vm_adminuser         = var.vm_adminuser
  path_to_publickey    = var.path_to_publickey
  location             = local.location
  rg_name              = local.resource_group_name
  web_publicip_id      = module.public_ip.public_ip
  ip_allocation_method = local.ip_allocation_method
  web_subnet_id        = local.web_subnet_id
  app_subnet_id        = local.app_subnet_id


}