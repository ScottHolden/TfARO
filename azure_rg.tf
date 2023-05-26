resource "azurerm_resource_group" "aro-rg" {
  name     = var.rg_name
  location = var.location
}