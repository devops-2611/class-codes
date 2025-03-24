variable "varvm" {}
variable "vardatanic" {}

data "azurerm_network_interface" "nidata1" {
    for_each = var.vardatanic
    name=each.value.name
    resource_group_name = each.value.resource_group_name
}



resource "azurerm_linux_virtual_machine" "vmblock" {
    for_each = var.varvm
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    disable_password_authentication=false

    admin_username = each.value.username
    admin_password = each.value.password    
    network_interface_ids = [data.azurerm_network_interface.nidata1[each.value.ni].id]
    
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}
