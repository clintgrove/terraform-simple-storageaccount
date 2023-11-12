# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_log_analytics_workspace" "this" {
  name                     = "${lower(var.envvar)}lawgr2${var.location}"
  resource_group_name      = var.resourcegroup
  location                 = var.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}