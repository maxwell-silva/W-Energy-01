resource "azurerm_lb" "web" {
  name                = "web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "public"
    public_ip_address_id = azurerm_public_ip.web.id
  }
}

resource "azurerm_public_ip" "web" {
  name                = "web-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "web" {
  name                = "web-backend-pool"
  loadbalancer_id     = azurerm_lb.web.id
}

resource "azurerm_lb_probe" "web" {
  name                = "web-probe"
  loadbalancer_id     = azurerm_lb.web.id
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_rule" "web" {
  name                           = "web-lb-rule"
  loadbalancer_id                = azurerm_lb.web.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "public"
  probe_id                       = azurerm_lb_probe.web.id
}
