resource "azurerm_sql_server" "sql_server" {
  for_each            = { for db in var.sql_databases : db.name => db }
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  version             = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"  // This should NEVER be hardcoded like this, doing it for this exercise but I fully understand this isn't good. 

  tags = each.value.tags
}

resource "azurerm_sql_database" "sql_db" {
  for_each            = { for db in var.sql_databases : db.name => db }
  name                = each.value.database_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = each.value.server_name

  tags = each.value.tags
}
