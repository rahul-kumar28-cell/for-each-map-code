variable "info-vm" {}

resource "azurerm_linux_virtual_machine" "example" {
  for_each                        = var.info-vm
  name                            = each.key
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  computer_name                   = each.value.computer_name
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [each.value.network_interface_ids]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
