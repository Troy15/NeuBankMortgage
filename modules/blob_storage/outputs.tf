output "blob_storage_account_ids" {
  value = { for blob in azurerm_storage_account.blob : blob.name => blob.id }
  description = "Map of Azure Blob Storage account names to their respective Azure resource ID."
}
