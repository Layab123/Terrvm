rg = {
  rg1 = {
    name     = "dev-gd_linux_vm_rg"
    location = "eastus"
  }
}


vnet = {
  vnet1 = {
    name                = "dev-gd-linux-vnet"
    location            = "eastus"
    resource_group_name = "dev-gd_linux_vm_rg"
    address_space       = ["10.0.0.0/16"]
  }
}


subnets = {
  subnet1 = {
    name                 = "dev-gd-linux-subnet"
    resource_group_name  = "dev-gd_linux_vm_rg"
    virtual_network_name = "dev-gd-linux-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

# nsg = {
#   nsg1 = {
#     name                = "gd-linux-nsg"
#     location            = "eastus"
#     resource_group_name = "dev-gd_linux_vm_rg"
#   }
# }

pip = {
  Public_IP1 = {
    name                = "dev-gd-linux-ip"
    resource_group_name = "dev-gd_linux_vm_rg"
    location            = "eastus"
    allocation_method   = "Static"
  }
}


nic = {
  nic1 = {

    name                = "dev-gd-linux-nic"
    location            = "eastus"
    resource_group_name = "dev-gd_linux_vm_rg"
    public_ip_name      = "dev-gd-linux-ip"
    subnet_name         = "dev-gd-linux-subnet"
    ip_config_name = "config123"
    virtual_network_name = "dev-gd-linux-vnet"
    private_ip_address_allocation = "Dynamic"
  }
}