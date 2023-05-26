resource "azurerm_virtual_network" "aro-vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.aro-rg.name
  location            = azurerm_resource_group.aro-rg.location
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "master-subnet" {
  name                 = "master-subnet"
  resource_group_name  = azurerm_resource_group.aro-rg.name
  virtual_network_name = azurerm_virtual_network.aro-vnet.name
  address_prefixes     = [var.vnet_master_subnet_cidr]
  service_endpoints    = ["Microsoft.ContainerRegistry"]
}

resource "azurerm_subnet" "worker-subnet" {
  name                 = "worker-subnet"
  resource_group_name  = azurerm_resource_group.aro-rg.name
  virtual_network_name = azurerm_virtual_network.aro-vnet.name
  address_prefixes     = [var.vnet_worker_subnet_cidr]
  service_endpoints    = ["Microsoft.ContainerRegistry"]
}
