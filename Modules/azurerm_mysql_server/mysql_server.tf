variable "info-mssql" {}


resource "azurerm_mssql_server" "example" {
  for_each                     = var.info-mssql
  name                         = each.key
  location                     = each.value.location
  version                      = each.value.version
  resource_group_name          = each.value.resource_group_name
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}
