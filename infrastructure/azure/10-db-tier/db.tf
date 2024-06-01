resource "azurerm_sql_server" "sql_server" {
  name                         = "w-energy-01-sql-server-v01"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "sql_server_database" {
  name                = "sql-db"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
}

resource "azurerm_sql_firewall_rule" "allow_access" {
  name                = "allow-access"
  resource_group_name = azurerm_sql_server.sql_server.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"  // forbidden access control by nsgrule
  end_ip_address      = "255.255.255.255" // forbidden access control by nsgrule
}

resource "azurerm_private_endpoint" "sql" {
  name                = "sql-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "sql-private-connection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_sql_server.sql_server.id
    subresource_names              = ["sqlServer"]
  }
}

resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql" {
  name                  = "sql-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = var.network_id
}

resource "azurerm_private_dns_a_record" "sql" {
  name                = "sql-a-record"
  zone_name           = azurerm_private_dns_zone.sql.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.sql.private_service_connection[0].private_ip_address]
}
