variable "rg-info" {}


resource "azurerm_resource_group" "rg" {
  for_each = var.rg-info
  name     = each.value.name
  location = each.value.location
}

