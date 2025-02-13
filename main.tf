resource "azurerm_resource_group" "rg-block" {
  name     = "facebook-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "sto-block" {
  name                     = "facebookstorage"
  resource_group_name      = azurerm_resource_group.rg-block.name
  location                 = azurerm_resource_group.rg-block.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_resource_group" "rg-block1" {
  name     = "facebook-rg1"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg-block2" {
  name     = "facebook-rg2"
  location = "West Europe"
}