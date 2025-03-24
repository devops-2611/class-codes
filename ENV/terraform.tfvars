# Resource Groups

varenvrg = {
  rg1 = {
    name     = "apple-rg1"
    location = "east us"
  }
  rg2 = {
    name     = "apple-rg2"
    location = "west us"
  }

}


varenvsa = {
  sa1 = {
    name                     = "applesa1"
    resource_group_name      = "apple-rg1"
    location                 = "east us"
    account_replication_type = "GRS"
    account_tier             = "Standard"
  }
  sa2 = {
    name                     = "applesa2"
    resource_group_name      = "apple-rg2"
    location = "west us"
    account_replication_type = "GRS"
    account_tier             = "Standard"
  }
}
varenvcont = {
  cont1 = {
    cont-name                  = "apple-cont1"
    container_access_type = "private"
    sa="sa1"
  }
  cont2 = {
    cont-name                  = "apple-cont2"
    container_access_type = "private"
    sa="sa1"
  }
  cont3 = {
    cont-name                  = "apple-cont3"
    container_access_type = "private"
    sa="sa2"
  }
  cont4 = {
    cont-name                  = "apple-cont4"
    container_access_type = "private"
    sa="sa2"
  }


}
varenvvn = {
  vn1 = {
    name                = "apple-vn1"
    resource_group_name = "apple-rg1"
    location            = "east us"
    address_space       = ["10.1.0.0/16"]
  }
  vn2 = {
    name                = "apple-vn2"
    resource_group_name = "apple-rg2"
    location            = "west us"
    address_space       = ["10.2.0.0/16"]
  }

}
varenvsn = {
  sn1 = {
    name                 = "apple-sn11"
    resource_group_name  = "apple-rg1"
    virtual_network_name = "apple-vn1"
    address_prefixes     = ["10.1.10.0/28"]
  }
  sn2 = {
    name                 = "apple-sn2"
    resource_group_name  = "apple-rg2"
    virtual_network_name = "apple-vn2"
    address_prefixes     = ["10.2.20.0/28"]
  }

}

varenvpi = {
  pi1 = {
    name                = "apple-pip1"
    resource_group_name = "apple-rg1"
    location            = "east us"
    allocation_method   = "Static"
  }
  pi2 = {
    name                = "apple-pip2"
    resource_group_name = "apple-rg2"
    location            = "west us"
    allocation_method   = "Static"
  }
}


varenvni = {
  ni1 = {
    name                          = "apple-ni1"
    resource_group_name           = "apple-rg1"
    location                      = "east us"
    public                        = "pi1"
    subnet                        = "sn1"
    ip-name                       = "apple-ip1"
    private_ip_address_allocation = "Dynamic"
  }
  ni2 = {
    name                          = "apple-ni2"
    resource_group_name           = "apple-rg2"
    location                      = "west us"
    public                        = "pi2"
    subnet                        = "sn2"
    ip-name                       = "apple-ip2"
    private_ip_address_allocation = "Dynamic"
  }
}


# Virtual Machines
varenvvm = {
  vm1 = {
    name                = "FE-VM"
    ni                  = "ni1"
    resource_group_name = "apple-rg1"
    location            = "east us"
    size                = "Standard_D4s_v3"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }
  vm2 = {
    name                = "BE-VM"
    ni                  = "ni2"
    resource_group_name = "apple-rg2"
    location            = "west us"
    size                = "Standard_F2"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }

}

# Network Security Groups
varenvnsg = {
  nsg1 = {
    name                = "apple-nsg1"
    location            = "east us"
    resource_group_name = "apple-rg1"
  }
  nsg2 = {
    name                = "apple-nsg2"
    location            = "west us"
    resource_group_name = "apple-rg2"
  }

}

# Network Security Group Network Interface Attachments
varenvnsgni = {
  nsgni1 = {
    nsg-name            = "apple-nsg1"
    resource_group_name = "apple-rg1"
    ni-name             = "apple-ni1"
  }
  nsgni2 = {
    nsg-name            = "apple-nsg2"
    resource_group_name = "apple-rg2"
    ni-name             = "apple-ni2"
  }

}
