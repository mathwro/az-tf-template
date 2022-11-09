
# ---- Azure Storage Account backend - Example 1 ----
# ---- Leverages service principal or user authentication ----
#terraform {
#  backend "azurerm" {
#    resource_group_name  = "<TODO>"
#    storage_account_name = "<TODO>"
#    container_name       = "<TODO>"
#    key                  = "<TODO>"
#  }
#}


# ---- Azure Storage Account backend - Example 2 ----
# ---- Leverages managed identity ----
#terraform {
#  backend "azurerm" {
#    resource_group_name  = "<TODO>"
#    storage_account_name = "<TODO>"
#    container_name       = "<TODO>"
#    key                  = "<TODO>"
#    use_msi              = true
#    subscription_id      = "00000000-0000-0000-0000-000000000000"
#    tenant_id            = "00000000-0000-0000-0000-000000000000"
#  }
#}

# ---- Azure Storage Account backend - Example 3 ----
# ---- Leverages storage account access key ----
#terraform {
#  backend "azurerm" {
#    storage_account_name = "<TODO>"
#    container_name       = "<TODO>"
#    key                  = "<TODO>"
#    access_key           = "<TODO>"
#  }
#}
