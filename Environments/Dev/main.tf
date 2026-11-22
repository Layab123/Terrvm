module "resource_group" {
  source             = "../../module/Resource_Group"
  resource_group     = var.rg

}

module "virtual_network" {
    depends_on = [ module.resource_group ]
  source = "../../module/Virtual_Network"
  virtual_network   = var.vnet

}


module "azurerm_subnet" {
    depends_on = [ module.virtual_network ]
  source = "../../module/Sub_Network"
  subnet = var.subnets

}


# module "azurerm_network_security_group" {
#   source = "../../module/nsg"
#   nsg    = var.nsg

#}

module "azurerm_public_ip" {
    depends_on = [ module.resource_group ]
  source    = "../../module/public_IP"
  public_ip = var.pip
}

module "azurerm_network_interface" {
    depends_on = [ module.azurerm_subnet ]
  source = "../../module/Network_Interface"
  network_interface    = var.nic

}