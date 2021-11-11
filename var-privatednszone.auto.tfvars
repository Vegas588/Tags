# https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-dns

resource_group_name = "Terraform1"

private_dns_zones = {
  zone1 = {
    dns_zone_name = "privatelink.vaultcore.azure.net" #KeyVault
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "vaultcore-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false #I think this is for VMs only
  },
  /*
  zone2 = {
    dns_zone_name = "privatelink.database.windows.net" #Azure SQL Database
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "first-vnet-link"
        vnet_name                 = "[__virtual_network_name__]"
        networking_resource_group = "[__networking_resource_group_name__]"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  },*/
  zone3 = {
    dns_zone_name = "privatelink.monitor.azure.com" #Azure Monitor
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "azmonitor-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  },
  zone4 = {
    dns_zone_name = "privatelink.oms.opinsights.azure.com" #Part of Azure Monitor Private Link Scope
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "oms-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  },
  zone5 = {
    dns_zone_name = "privatelink.ods.opinsights.azure.com" #Part of Azure Monitor Private Link Scope
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "ods-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  },
  zone6 = {
    dns_zone_name = "privatelink.agentsvc.azure-automation.net" #Part of Azure Monitor Private Link Scope
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "agentsvc-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  },
  zone7 = {
    dns_zone_name = "privatelink.blob.core.windows.net" #Storage Accounts
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name    = "blob-to-vnet-eastus2-01"
        vnet_name                 = "vnet-eastus2-01"
        networking_resource_group = "Terraform1"
        zone_to_vnet_link_exists  = false
      }
    ]
    registration_enabled = false
  }
}

dns_zone_additional_tags = {
  dnszones = "private"
  iac      = "Terraform"
}
