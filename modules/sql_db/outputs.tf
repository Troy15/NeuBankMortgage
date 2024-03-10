output "sql_server_ids" {
  value = {for sql in azurerm_mssql_server.sql_server : sql.name => sql.id}
  description = "The IDs of the created SQL Servers."
}

output "sql_server_fqdns" {
  value = {for sql in azurerm_mssql_server.sql_server : sql.name => sql.fully_qualified_domain_name}
  description = "The fully qualified domain names of the created SQL Servers."
}
