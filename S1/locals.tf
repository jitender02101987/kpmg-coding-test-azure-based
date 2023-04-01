locals {
  name_prefix          = "${var.project}-${var.environment}"
  tfsuffix             = var.tfsuffix
  resource_group_name  = module.resourcegroup.resource_group_name
  location             = var.location
  ip_allocation_method = var.ip_allocation_method
  app_subnet_id        = module.networking.app_subnet_id
  web_subnet_id        = module.networking.web_subnet_id
  db_subnet_id         = module.networking.db_subnet_id
  vm_size              = var.vm_size
}