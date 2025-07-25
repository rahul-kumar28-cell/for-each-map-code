variable "container-info" {}


resource "azurerm_storage_container" "mycontainer" {
  for_each              = var.container-info
  name                  = each.key
  storage_account_id    = each.value.storage_account_id
  container_access_type = each.value.container_access_type
}
