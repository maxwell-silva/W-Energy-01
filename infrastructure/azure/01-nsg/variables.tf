variable "location" {
  type = string
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "allowed_ip" {
  type = string
  description = "The IP address to allow SSH access from"
}

variable "app_subnet_mask" {
  description = "The subnet mask for the application subnet"
  default     = "10.0.2.0/24"
}

variable "web_subnet_mask" {
  description = "The subnet mask for the application subnet"
  default     = "10.0.1.0/24"
}

variable "web_subnet_id" {
  type = string
  description = "The subnet ID for the web tier"
}

variable "app_subnet_id" {
  type = string
  description = "The subnet ID for the app tier"
}

variable "db_subnet_id" {
  type = string
  description = "The subnet ID for the db tier"
}