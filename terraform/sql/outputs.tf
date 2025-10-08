output "primary_fqdn" { value = azurerm_mssql_server.primary.fully_qualified_domain_name }
output "failover_group_name" { value = azurerm_mssql_failover_group.fog.name }
