#
# ---- These variables are needed if created from input variables ----
#
# variable "client_id" {
#   description = "Application ID of the acting service principle"
#   type        = string
# }
# 
# variable "client_secret" {
#   description = "Application secting of the acting service principle"
#   type        = string
#   sensitive   = true
# }
#
#variable "subscription_id" {
#  description = "Subscription ID of the targeted scope"
#  type        = string
#}
#
#variable "tenant_id" {
#    description = "ID of the target tenant"
#    type = string
#}

variable "nsgNames" {
  type = list(string)
}

variable "tags" {
  description = "Predetermined tags"
  type = object({
    ownerName   = string
    ownerEmail  = string
    serviceName = string
    company     = string
  })
}

variable "instance_size" {
  description = "Determines the size of the VM"
  type        = string
  default     = "Standard_B1ms"
}

variable "location" {
  description = "Specifies the location for the deployment"
  type        = string
}

variable "subnet_newbits" {
  description = "Specifies the newbit values for subnet generation"
  type        = number
}

variable "subnet_count" {
  description = "Specifies the amount of subnets"
}

variable "servicename" {
  description = "Name of the service"
  type        = string
}

variable "vnet_cidrs" {
  description = "List of VNET cidrs"
  type        = list(string)
}

variable "dns_servers" {
  description = "Custom specified DNS servers"
  type = list(string)
  default = []
}
