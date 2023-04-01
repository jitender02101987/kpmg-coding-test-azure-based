variable "vnet_name" {
  type = string
}
variable "vnet_location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "vnet_cidr" {
  type = list(string)
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
variable "web_subnet_cidr" {
  type = list(string)
}
variable "app_subnet_cidr" {
  type = list(string)
}
variable "data_subnet_cidr" {
  type = list(string)
}
