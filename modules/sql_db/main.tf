resource "azurerm_sql_server" "sql_server" {
  for_each            = { for db in var.sql_databases : db.name => db }
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  version             = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"

  tags = each.value.tags
}

resource "azurerm_sql_database" "sql_db" {
  for_each            = { for db in var.sql_databases : db.name => db }
  name                = each.value.database_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = each.value.server_name
  sku_name            = each.value.sku_name
  max_size_gb         = each.value.max_size_gb

  tags = each.value.tags
}
