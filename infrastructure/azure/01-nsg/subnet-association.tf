resource "azurerm_subnet_network_security_group_association" "app-nsg" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_subnet_network_security_group_association" "web-nsg" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web.id
}

resource "azurerm_subnet_network_security_group_association" "db-nsg" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db.id
}