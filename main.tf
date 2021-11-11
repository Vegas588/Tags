module "resourceGroup" {
  source          = "./Modules/resourcegroup"
  resource_groups = var.resource_groups
}

/*
module "keyvaults" {
  source     = "./Modules/keyvault"
  key_vaults = var.key_vaults
  # make sure resource groups are created first.
  depends_on = [
    module.resourceGroup
  ]
}
*/

module "networking" {
  source           = "./Modules/vnet"
  virtual_networks = var.virtual_networks
  subnets          = var.subnets
  vnet_peering     = var.vnet_peering
  # make sure resource groups are created first.
  depends_on = [
    module.resourceGroup
  ]
}
