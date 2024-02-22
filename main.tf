// Base resource example with string concatination
resource "azurerm_resource_group" "rg01" {
  name     = "${var.servicename}-rg"
  location = var.location
  tags     = var.tags
}

// Module example
module "vnet01" {
  source      = "./Modules/az-vnet"
  servicename = var.servicename
  rg_name     = azurerm_resource_group.rg01.name
  location    = azurerm_resource_group.rg01.location
  tags        = var.tags
  network_config = {
    subnet_count   = var.subnet_count
    subnet_newbits = var.subnet_newbits
    vnet_cidrs     = var.vnet_cidrs
    dns_servers    = var.dns_servers
  }
}

// Base resource with for_each looping
resource "azurerm_network_security_group" "nsg01" {
  for_each            = toset(var.nsgNames)
  name                = each.key
  location            = var.location
  resource_group_name = azurerm_resource_group.rg01.name
}

// Default rule using Data Source to get the IP of the agent performing the deployment
resource "azurerm_network_security_rule" "nsg01-default" {
  for_each = toset(var.nsgNames)
  network_security_group_name = azurerm_network_security_group.nsg01[each.key].name
  resource_group_name         = azurerm_network_security_group.nsg01[each.key].resource_group_name
  access                      = "Allow"
  description                 = "Deployment Agent Rule"
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "IN-DEPLOYMENT-AGENT"
  priority                    = 1000
  protocol                    = "Tcp"
  source_address_prefix       = chomp(data.http.agentip.response_body)
  source_port_range           = "*"
}