resource "azurerm_virtual_network" "vnet01" {
  name                = "${var.servicename}-vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.network_config.vnet_cidrs
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = toset(local.subnetList)
  name                 = "subnet-${index(local.subnetList, each.value)}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = [each.value]
}

resource "azurerm_virtual_network_dns_servers" "vnet01-dns" {
  count              = var.network_config.dns_servers == null ? 0 : 1
  virtual_network_id = azurerm_virtual_network.vnet01.id
  dns_servers        = var.network_config.dns_servers
}
