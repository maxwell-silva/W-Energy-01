variable "location" {
  type = string
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "app_subnet_id" {
  type = string
  description = "The ID of the subnet to deploy the NAT Gateway in"
}

variable "db_subnet_id" {
  type = string
  description = "The ID of the subnet to deploy the NAT Gateway in"
}

variable "web_subnet_id" {
  type = string
  description = "The ID of the subnet to deploy the NAT Gateway in"
}