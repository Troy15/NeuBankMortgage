resource "azurerm_storage_account" "blob" {
  count                    = length(var.blob_storages)
  name                     = var.blob_storages[count.index].name
  resource_group_name      = var.blob_storages[count.index].resource_group_name
  location                 = var.blob_storages[count.index].location
  account_tier             = var.blob_storages[count.index].account_tier
  account_replication_type = var.blob_storages[count.index].account_replication_type
  account_kind             = var.blob_storages[count.index].account_kind
  access_tier              = var.blob_storages[count.index].access_tier
  tags                     = var.blob_storages[count.index].tags
}
