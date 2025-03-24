variable "varcont" {}
variable "varsa-data" {}

data "azurerm_storage_account" "sa-data-block" {
    for_each = var.varsa-data
    name= each.value.name
    resource_group_name = each.value.resource_group_name
  
}


resource "azurerm_storage_container" "cont-block" {
    for_each = var.varcont
    name = each.value.cont-name
    storage_account_id =data.azurerm_storage_account.sa-data-block[each.value.sa].id
    container_access_type = each.value.container_access_type
  
}