
#############################################################################
# Provider Authentication
#############################################################################

# Terraform supports a number of different methods for authenticating to Azure.
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
# Below, we are using a service principal and client secret


variable "subscription_id" {
  description = "Azure subscription Id"
  default     = null
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant Id"
  default     = null
  type        = string
}

variable "client_id" {
  description = "Azure service principal application Id"
  default     = null
  type        = string
}

variable "client_secret" {
  description = "Azure service principal application Secret"
  default     = null
  type        = string
}

# #############################################################################
# # Resource Group Variables
# #############################################################################
variable "resource_groups" {
  description = "Resource groups"
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}
/*
# #############################################################################
# # Key Vault Variables
# #############################################################################
variable "key_vaults" {
  description = "Key Vaults and their properties."
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    purge_protection_enabled        = bool
    soft_delete_retention_days      = number
    tags                            = map(string)
  }))
  default = {}
}
*/
# #############################################################################
# # Network, Subnet, Peering Variables
# #############################################################################


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
