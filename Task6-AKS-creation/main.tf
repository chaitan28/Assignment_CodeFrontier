provider "azurerm" {
  features {}
  subscription_id = "1d342b09-7474-440d-a4c0-4d42e7768976"  
}

#  Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "Aks-rg"
  location = "East US"
}

#  Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

#  Subnet for AKS
resource "azurerm_subnet" "subnet" {
  name                 = "my-aks-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}

#  AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"

 default_node_pool {
  name           = "default"
  node_count     = 2
  vm_size        = "Standard_DS2_v2"
  vnet_subnet_id = azurerm_subnet.subnet.id
  os_sku         = "Ubuntu"  # Ensure only Ubuntu nodes are used
}

  identity {
    type = "SystemAssigned"
  }
 depends_on = [azurerm_subnet.subnet]  # Ensures subnet exists before AKS creation
  tags = {
    Environment = "Dev"
  }
}


