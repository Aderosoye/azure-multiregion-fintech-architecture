resource "azurerm_mssql_server" "primary" {
  name                         = "${var.name_prefix}-sqlpri"
  resource_group_name          = var.resource_group_name
  location                     = var.primary_location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_server" "secondary" {
  name                         = "${var.name_prefix}-sqlsec"
  resource_group_name          = var.resource_group_name
  location                     = var.secondary_location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "db" {
  name           = "${var.name_prefix}-db"
  server_id      = azurerm_mssql_server.primary.id
  sku_name       = "GP_Gen5_2"
  max_size_gb    = 32
  zone_redundant = false
}

resource "azurerm_mssql_failover_group" "fog" {
  name      = "${var.name_prefix}-fog"
  server_id = azurerm_mssql_server.primary.id

  databases = [azurerm_mssql_database.db.id]

  partner_server {
    id = azurerm_mssql_server.secondary.id
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }
}

output "primary_fqdn" {
  value = azurerm_mssql_server.primary.fully_qualified_domain_name
}

output "failover_group_name" {
  value = azurerm_mssql_failover_group.fog.name
}
