resource "azurerm_mssql_server" "sql_server" {
  for_each = {for sql in var.sql_servers : sql.name => sql}

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  tags = each.value.tags
}
