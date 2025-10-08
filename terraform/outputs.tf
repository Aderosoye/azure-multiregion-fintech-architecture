output "primary_app_name" { value = module.appservice_primary.app_name }
output "secondary_app_name" { value = module.appservice_secondary.app_name }
output "sql_server_fqdn" { value = module.sql.primary_fqdn }
output "failover_group_name" { value = module.sql.failover_group_name }
