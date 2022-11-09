terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.30.0"
    }
  }
  required_version = ">= 1.3.0"
}

# Reading credentials from json file
locals {
  credentialFile = jsondecode(file("./credentials.json"))
}
provider "azurerm" {
  client_id       = local.credentialFile.application_id
  client_secret   = local.credentialFile.application_secret
  tenant_id       = local.credentialFile.tenant_id
  subscription_id = local.credentialFile.subscription_id
  features {}
}

#
# Reading credentials from variables
# Uncomment the associated variables in variables.tf
#
#provider "azurerm" {
#  client_secret   = var.client-secret
#  client_id       = var.client-id
#  subscription_id = var.subscription-id
#  tenant_id       = var.tenant_id
#  features {}
#}
