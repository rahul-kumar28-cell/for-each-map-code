variable "info-database" {}


resource "azurerm_mssql_database" "example" {
  for_each     = var.info-database
  name         = each.key
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
}
