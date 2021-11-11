# List of virtual network objects
virtual_networks = [
  {
    name                = "vnet-eastus2-01"
    resource_group_name = "Terraform1"
    location            = "eastus2"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = null #List of IP Addresses for DNS servers
    tags = {
      vnet = "first vnet"
    }
    ddos_protection_plan = null #DDOS Standard Protection (vs. Basic) is $2,944 month, which covers 100 public IP addresses. Kind of pricey, so we can assume this is likely always Basic.
  },
  {
    name                = "vnet-eastus2-02"
    resource_group_name = "Terraform2"
    location            = "eastus2"
    address_space       = ["11.0.0.0/16"]
    dns_servers         = null #List of IP Addresses for DNS servers
    tags = {
      vnet = "second vnet"
    }
    ddos_protection_plan = null
  }
]

vnet_peering = {
  peering1 = {
    source_vnet_name             = "vnet-eastus2-01"
    destination_vnet_name        = "vnet-eastus2-02"
    destination_vnet_rg          = "Terraform2" # used for locals looking up the ID??
    rg_name                      = "Terraform1" # RG to place the actual peering into
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}

# a map of subnets
subnets = {
  subnet1 = {
    rg_name           = "Terraform1"
    vnet_name         = "vnet-eastus2-01"
    name              = "snet-eastus2-01"
    address_prefixes  = ["10.0.1.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    rg_name           = "Terraform2"
    vnet_name         = "vnet-eastus2-02"
    name              = "snet-eastus2-02"
    address_prefixes  = ["11.0.1.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = []
  },
  subnet3 = {
    rg_name           = "Terraform1"
    vnet_name         = "vnet-eastus2-01"
    name              = "pe-snet-eastus2-01"
    address_prefixes  = ["10.0.2.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = []
  },
}
