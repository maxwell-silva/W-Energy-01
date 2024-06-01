variable "allowed_ip" {
  type = string
  description = "The IP address to allow ssh access from"
  
}

variable "client_id" {
  type = string
  description = "The Client ID of the Service Principal"
}

variable "client_secret" {
  type = string
  description = "The Client Secret of the Service Principal"
  sensitive   = true
}

variable "tenant_id" {
  type = string
  description = "The Tenant ID of the Service Principal"
}

variable "subscription_id" {
  type = string
  description = "The Subscription ID"
}

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

variable "sql_admin_username" {
  type = string
  description = "The admin username for the SQL Server"
}

variable "sql_admin_password" {
  type = string
  description = "The admin password for the SQL Server"
}
