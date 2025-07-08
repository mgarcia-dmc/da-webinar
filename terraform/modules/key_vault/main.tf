resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  tenant_id                   = var.tenant_id
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = "standard"
}
