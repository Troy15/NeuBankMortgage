variable "blob_storages" {
  description = "A list of Azure Blob Storage specifications"
  type = list(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string
    access_tier              = string
    tags                     = map(string)
  }))
}
