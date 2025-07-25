rg-info = {
  "rg1" = {
    name     = "rg-moto"
    location = "Central India"
  }
}

stg-info = {
  "macstorage342" = {
    resource_group_name      = "rg-moto"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

container-info = {
  "jalebicontainer" = {
    storage_account_id    = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Storage/storageAccounts/macstorage342"
    container_access_type = "private"
  }
}


vnet-info = {
  "dahi-vnet" = {
    location            = "Central India"
    resource_group_name = "rg-moto"
    address_space       = ["10.0.0.0/20"]
  }
}

subnet-info = {
  "frontend-subnet" = {
    resource_group_name  = "rg-moto"
    virtual_network_name = "dahi-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  "backend-subnet" = {
    resource_group_name  = "rg-moto"
    virtual_network_name = "dahi-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

}

nic-info = {
  "f-dangernic" = {
    location                      = "Central India"
    resource_group_name           = "rg-moto"
    name                          = "conf-1"
    subnet_id                     = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/virtualNetworks/dahi-vnet/subnets/frontend-subnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/publicIPAddresses/f-publicip"
  }

  "b-dengernic" = {
    location                      = "Central India"
    resource_group_name           = "rg-moto"
    name                          = "conf-2"
    subnet_id                     = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/virtualNetworks/dahi-vnet/subnets/backend-subnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/publicIPAddresses/b-publicip"
  }
}


info-pulicip = {
  "f-publicip" = {
    resource_group_name = "rg-moto"
    location            = "Central India"
    allocation_method   = "Static"

  }

  "b-publicip" = {
    resource_group_name = "rg-moto"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

info-vm = {
  "frontend-vm" = {
    resource_group_name             = "rg-moto"
    location                        = "Central India"
    size                            = "Standard_F2"
    computer_name                   = "virus-laptop"
    admin_username                  = "adminuser"
    admin_password                  = "admin@12345"
    disable_password_authentication = false
    network_interface_ids           = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/networkInterfaces/f-dangernic"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }

  "backend-vm" = {
    resource_group_name             = "rg-moto"
    location                        = "Central India"
    size                            = "Standard_F2"
    computer_name                   = "boom-laptop"
    admin_username                  = "adminuser"
    admin_password                  = "admin@12345"
    disable_password_authentication = false
    network_interface_ids           = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Network/networkInterfaces/b-dengernic"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}


info-mssql = {
  "johnmssql" = {
    location                     = "Central India"
    version                      = "12.0"
    resource_group_name          = "rg-moto"
    administrator_login          = "mysqladminun"
    administrator_login_password = "H@Sh1CoR3!"
  }
}

info-database = {
  "sqldb" = {
    server_id    = "/subscriptions/c64cf66f-900c-4cad-b6cd-ee68a9839e8a/resourceGroups/rg-moto/providers/Microsoft.Sql/servers/johnmssql"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
  }

}
