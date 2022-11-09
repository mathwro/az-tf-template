variable "servicename" {
  type = string
}
variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "network_config" {
  type = object({
    vnet_cidrs     = list(string)
    subnet_count   = number
    subnet_newbits = number
    dns_servers    = optional(list(string))
  })
}
variable "tags" {
  type = object({
    ownerName   = string
    ownerEmail  = string
    serviceName = string
    company     = string
  })
}
