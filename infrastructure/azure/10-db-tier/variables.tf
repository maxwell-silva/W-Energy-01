variable "location" {
  type = string
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "sql_admin_username" {
  type = string
  description = "The admin username for the SQL Server"
}

variable "sql_admin_password" {
  type = string
  description = "The admin password for the SQL Server"
}

variable "network_id" {
  type = string
  description = "The ID of the virtual network"
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet"
}