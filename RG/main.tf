variable "varrg" {}

resource "azurerm_resource_group" "rg-block" {
    for_each = var.varrg
    name= each.value.name
    location = each.value.location
  
}