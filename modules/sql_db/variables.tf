variable "sql_databases" {
  description = "A list of Azure SQL Database specifications"
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    server_name         = string
    database_name       = string
    sku_name            = string
    max_size_gb         = number
    tags                = map(string)
  }))
}
