module "azurerm_resource_group" {
  source = "../module/rg"
  rg     = var.rg

}

module "virtual_network_name" {
    depends_on = [ module.azurerm_resource_group ]
  source = "../module/vnet"
  vnet   = var.vnet

}


module "azurerm_subnet" {
    depends_on = [ module.virtual_network_name ]
  source = "../module/subnet"
  subnet = var.subnets

}


# module "azurerm_network_security_group" {
#   source = "../module/nsg"
#   nsg    = var.nsg

#}

module "azurerm_public_ip" {
    depends_on = [ module.azurerm_resource_group ]
  source    = "../module/public_IP"
  pip = var.pip

}

module "azurerm_network_interface" {
    depends_on = [ module.azurerm_subnet ]
  source = "../module/nic"
  nic    = var.nic
  pip    = var.pip
  subnets = var.subnets

}