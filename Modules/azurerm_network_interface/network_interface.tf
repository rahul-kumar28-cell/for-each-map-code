variable "nic-info" {}


resource "azurerm_network_interface" "example" {
  for_each            = var.nic-info
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = each.value.public_ip_address_id
  }
}
