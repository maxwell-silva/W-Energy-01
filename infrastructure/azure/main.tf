// cspell:ignore azurerm vnet
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "vnet" {
  source = "./00-vnet"
  resource_group_name = var.resource_group_name
}

module "nsg" {
  source       = "./01-nsg"
  depends_on = [ module.vnet ]
  resource_group_name = var.resource_group_name
  allowed_ip = var.allowed_ip
  app_subnet_id = module.vnet.app_subnet_id
  web_subnet_id = module.vnet.web_subnet_id
  db_subnet_id = module.vnet.db_subnet_id
}

module "nat-gateway" {
  source        = "./02-nat-gateway"
  depends_on    = [ module.vnet, module.nsg ]
  resource_group_name = var.resource_group_name
  app_subnet_id = module.vnet.app_subnet_id
  web_subnet_id = module.vnet.web_subnet_id
  db_subnet_id = module.vnet.db_subnet_id
}

module "db-tier" {
  source              = "./10-db-tier"
  depends_on          = [ module.vnet, module.nat-gateway ]
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  subnet_id           = module.vnet.db_subnet_id
  network_id          = module.vnet.vnet_id
}

module "app-tier" {
  source              = "./20-app-tier"
  depends_on          = [ module.db-tier ]
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_password      = var.admin_password
  admin_username      = var.admin_username
  subnet_id           = module.vnet.app_subnet_id
}

module "web-tier" {
  source              = "./30-web-tier"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_password      = var.admin_password
  admin_username      = var.admin_username
  subnet_id           = module.vnet.web_subnet_id
  network_id          = module.vnet.vnet_id
  depends_on          = [ module.app-tier ]
}