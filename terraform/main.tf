terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

module "resource_group" {
  source              		= "./modules/resource_group"
  resource_group_name 		= var.resource_group_name
  location           		= var.location
}

module "storage_account" {
  source               		= "./modules/storage_account"
  storage_account_name 		= var.storage_account_name
  resource_group_name  		= var.resource_group_name
  location             		= var.location
  depends_on           		= [module.resource_group]
}

module "data_factory" {
  source              = "./modules/data_factory"
  adf_name            = var.adf_name
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on          = [module.resource_group]
}

module "key_vault" {
  source              	= "./modules/key_vault"
  kv_name              	= var.kv_name
  resource_group_name  	= var.resource_group_name
  location           	= var.location
  tenant_id				= var.tenant_id
  depends_on            = [module.resource_group]
}
