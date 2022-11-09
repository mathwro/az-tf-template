output "vnet" {
  value = module.vnet01.az-vnet-01
}

output "subnets" {
  value = module.vnet01.az-subnets
}