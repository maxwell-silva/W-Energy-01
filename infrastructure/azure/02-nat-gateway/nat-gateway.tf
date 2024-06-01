resource "azurerm_nat_gateway" "internet" {
  name                = "internet-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"
}

resource "azurerm_public_ip" "internet" {
  name                = "internet-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_subnet_nat_gateway_association" "nat-gateway-association-web" {
  subnet_id      = var.web_subnet_id
  nat_gateway_id = azurerm_nat_gateway.internet.id
}

resource "azurerm_subnet_nat_gateway_association" "nat-gateway-association-app" {
  subnet_id      = var.app_subnet_id
  nat_gateway_id = azurerm_nat_gateway.internet.id
}

resource "azurerm_subnet_nat_gateway_association" "nat-gateway-association-db" {
  subnet_id      = var.db_subnet_id
  nat_gateway_id = azurerm_nat_gateway.internet.id
}