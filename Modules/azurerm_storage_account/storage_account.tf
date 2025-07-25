variable "stg-info" {}

resource "azurerm_storage_account" "stg" {
  for_each                 = var.stg-info
  name                     = each.key
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
