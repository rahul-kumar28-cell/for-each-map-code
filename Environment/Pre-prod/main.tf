module "rg" {
  source  = "../../Modules/azurerm_resource_group"
  rg-info = var.rg-info
}

module "stg" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_storage_account"
  stg-info   = var.stg-info
}

module "container" {
  depends_on     = [module.stg]
  source         = "../../Modules/azurerm_storage_container"
  container-info = var.container-info
}

module "vnet" {
  depends_on = [module.container]
  source     = "../../Modules/azurerm_virtual_network"
  vnet-info  = var.vnet-info
}

module "subnet" {
  depends_on  = [module.vnet]
  source      = "../../Modules/azurerm_subnet"
  subnet-info = var.subnet-info
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../Modules/azurerm_network_interface"
  nic-info   = var.nic-info
}

module "public-ip" {
  depends_on   = [module.nic]
  source       = "../../Modules/azurerm_public_ip"
  info-pulicip = var.info-pulicip
}

module "vm" {
  depends_on = [module.nic]
  source     = "../../Modules/azurerm_linux_virtual_machine"
  info-vm    = var.info-vm
}

module "MssQl" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_mysql_server"
  info-mssql = var.info-mssql
}


module "MssqlDB" {
  depends_on    = [module.MssQl]
  source        = "../../Modules/azurerm_sql_database"
  info-database = var.info-database
}