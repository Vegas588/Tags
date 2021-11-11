# -
# - Virtual Network
# - designed to create multiple VNETs if needed
variable "virtual_networks" {
  description = "The virtual networks with their properties list."
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = list(string)
    tags                = map(string)
    ddos_protection_plan = object({
      id     = string
      enable = bool
    })
  }))
}

# -
# - Virtual Network Peering
# -
variable "vnet_peering" {
  description = "Vnet Peering to the destination Vnet"
  type = map(object({
    destination_vnet_name        = string
    destination_vnet_rg          = string
    source_vnet_name             = string
    rg_name                      = string
    allow_virtual_network_access = bool
    allow_forwarded_traffic      = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
  default = {}
}

# -
# - Subnet object
# - 
variable "subnets" {
  description = "The virtal networks subnets with their properties."
  type = map(object({
    name              = string
    rg_name           = string
    vnet_name         = string
    address_prefixes  = list(string)
    pe_enable         = bool
    service_endpoints = list(string)
    delegation = list(object({
      name = string
      service_delegation = list(object({
        name    = string
        actions = list(string)
      }))
    }))
  }))
  default = {}
}
