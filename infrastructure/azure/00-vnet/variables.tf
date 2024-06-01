variable "location" {
  type = string
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}