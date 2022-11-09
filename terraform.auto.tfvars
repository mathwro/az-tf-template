# Basic configuration information
servicename = "TF-Demo"
location    = "West Europe"
tags = {
  ownerEmail  = "demo@email.com"
  ownerName   = "TF-Demo"
  serviceName = "TF-Demo"
  company     = "Demo Inc."
}

# ---- Network configuration ----
subnet_count   = 4
subnet_newbits = 3
vnet_cidrs     = ["10.0.0.0/24"]

# ---- Optional: DNS Servers ----
#dns_servers = ["10.0.0.1", "10.0.0.2"]
