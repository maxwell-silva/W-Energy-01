
resource "azurerm_virtual_network" "w-energy-01" {
  name                = "w-energy-01_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "web" {
  name                 = "web-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.w-energy-01.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "app-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.w-energy-01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "db" {
  name                 = "db-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.w-energy-01.name
  address_prefixes     = ["10.0.3.0/24"]
}

output "vnet_name" {
  value = azurerm_virtual_network.w-energy-01.name
}

output "vnet_id" {
  value = azurerm_virtual_network.w-energy-01.id
}

output "web_subnet_name" {
  value = azurerm_subnet.web.name
}

output "app_subnet_name" {
  value = azurerm_subnet.app.name
}

output "db_subnet_name" {
  value = azurerm_subnet.db.name
}

output "db_subnet_id" {
  value = azurerm_subnet.db.id
}
output "app_subnet_id" {
  value = azurerm_subnet.app.id
}

output "app_subnet_mask" {
  value = azurerm_subnet.app.address_prefixes
}

output "web_subnet_mask" {
  value = azurerm_subnet.web.address_prefixes
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}