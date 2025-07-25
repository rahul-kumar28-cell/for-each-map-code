variable "info-pulicip" {}

resource "azurerm_public_ip" "billipublicip" {
  for_each            = var.info-pulicip
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}
