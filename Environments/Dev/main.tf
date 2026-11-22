module "resource_group" {
  source = "../Environment/Resource_Group"
  rg     = var.resource_group

}

module "virtual_network_name" {
    depends_on = [ module.azurerm_resource_group ]
  source = "../Environment/Virtual_Network"
  vnet   = var.virtual_network

}


module "azurerm_subnet" {
    depends_on = [ module.virtual_network_name ]
  source = "../Environment/Sub_Network"
  subnet = var.subnets

}


# module "azurerm_network_security_group" {
#   source = "../module/nsg"
#   nsg    = var.nsg

#}

module "azurerm_public_ip" {
    depends_on = [ module.azurerm_resource_group ]
  source    = "../Environment/Public_IP"
  pip = var.pip

}

module "azurerm_network_interface" {
    depends_on = [ module.azurerm_subnet ]
  source = "../Environment/Network_Interface"
  nic    = var.nic
  pip    = var.pip
  subnets = var.subnets

}