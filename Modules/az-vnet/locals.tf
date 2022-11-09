locals {
  subnetList = cidrsubnets(tostring(var.network_config.vnet_cidrs[0]), [for v in range(var.network_config.subnet_count) : var.network_config.subnet_newbits]...)
}
