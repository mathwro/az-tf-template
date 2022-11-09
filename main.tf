resource "azurerm_resource_group" "rg01" {
  name     = "${var.servicename}-rg"
  location = var.location
  tags     = var.tags
}

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
