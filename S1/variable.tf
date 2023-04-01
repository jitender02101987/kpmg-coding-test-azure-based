variable "project" {
  type = string
}
variable "environment" {
  type = string
}
variable "tfsuffix" {
  type = string
}
variable "location" {
  type = string
}
variable "vnet_cidr" {
  type = list(string)
}
variable "web_subnet_cidr" {
  type = list(string)
}
variable "app_subnet_cidr" {
  type = list(string)
}
variable "data_subnet_cidr" {
  type = list(string)
}
variable "ip_allocation_method" {
  type = string
}
variable "mysql_db_admin" {
  type = string
}
variable "mysql_server_version" {
  type = string
}
variable "mysql_db_sku" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "vm_adminuser" {
  type = string
}
variable "path_to_publickey" {
  type = string
}
variable "websubnet_name" {
  type = string
}
variable "appsubnet_name" {
  type = string
}
variable "datasubnet_name" {
  type = string
}
variable "mysql_db_pass" {
  type = string
  validation {
    condition     = length(var.mysql_db_pass) > 8
    error_message = "The length of password should be more than 8 characters"
  }
}