output "sql_server_ids" {
  value = { for sql_server in azurerm_sql_server.sql_server : sql_server.name => sql_server.id }
  description = "Map of SQL Server names to their respective Azure resource ID."
}

output "sql_database_ids" {
  value = { for sql_db in azurerm_sql_database.sql_db : sql_db.name => sql_db.id }
  description = "Map of SQL Database names to their respective Azure resource ID."
}
