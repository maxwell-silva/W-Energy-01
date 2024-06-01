variable "location" {
  type = string
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the VMs"
}

variable "admin_password" {
  description = "The admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet"
}