terraform {
  backend "azurerm" {
    resource_group_name   = "az-<INICIALES>-dev-de-rg-tf"
    storage_account_name  = "az<INICIALES>devdedlstf"
    container_name        = "terraform"
    key                   = "terraform.terraform"
  }
}
