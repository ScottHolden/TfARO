# Assigns a given Principal (User or Group) to a given Role.

resource "azurerm_role_assignment" "virtual-network-assignment" {
  scope                = azurerm_virtual_network.aro-vnet.id
  role_definition_name = "Contributor"
  principal_id         = var.aro_sp_client_object_id
}

resource "azurerm_role_assignment" "resource-provider-assignment" {
  scope                = azurerm_virtual_network.aro-vnet.id
  role_definition_name = "Contributor"
  principal_id         = var.aro_rp_object_id
}