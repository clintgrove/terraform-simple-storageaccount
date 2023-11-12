terraform {
    backend "azurerm" {
      resource_group_name ="NetworkWatcherRG" ##"lz-data-${lower(var.environment)}-uks-rg-01"
      storage_account_name = "${lower(var.envvar)}terrastate919"
      container_name = "tfstate-workit"
      key = "terraform.tfstate"
    }
}

data "azurerm_client_config" "current" {

}
data "external" "me" {
  program = ["az", "account", "show", "--query", "user"]
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
}

