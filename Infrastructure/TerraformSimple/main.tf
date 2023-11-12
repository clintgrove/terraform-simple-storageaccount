terraform {
    backend "azurerm" {
      resource_group_name ="NetworkWatcherRG" 
      storage_account_name = "${lower(var.envvar)}terrastate919"
      container_name = "tfstate-workit"
      key = "terraform.tfstate"
    }
}

data "azurerm_client_config" "current" {

}

#############################################################################
#                               Making a Resource Group
#############################################################################

resource "azurerm_resource_group" "this" {
  name     = "terrraf-${lower(var.envvar)}-uks-01"
  location = "UK South"
}

#############################################################################
#                               Making a storage account
#############################################################################

resource "azurerm_storage_account" "this" {
  name                     = "${lower(var.envvar)}sacgr2${var.location}"
  resource_group_name      = var.resourcegroup
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [ azurerm_resource_group.this ]
}

#############################################################################
#                               Making a kEY vAULT
#############################################################################

module "avm-res-keyvault-vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.5.0"
  name = "keyvaultcgr2terraf"
  resource_group_name   = var.resourcegroup
  location              = var.location
  tenant_id             = var.tenant_id
  depends_on = [ azurerm_resource_group.this ]
}

