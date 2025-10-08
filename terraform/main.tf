module "appservice_primary" {
  source              = "./modules/appservice"
  app_name            = var.app_name
  location            = var.primary_location
  resource_group_name = var.resource_group_name
  sku_name            = var.appservice_sku
}

module "appservice_secondary" {
  source              = "./modules/appservice"
  app_name            = "${var.app_name}-sec"
  location            = var.secondary_location
  resource_group_name = var.resource_group_name
  sku_name            = var.appservice_sku
}

module "sql" {
  source               = "./modules/sql"
  name_prefix          = var.app_name
  primary_location     = var.primary_location
  secondary_location   = var.secondary_location
  resource_group_name  = var.resource_group_name
  admin_login          = var.sql_admin_login
  admin_password       = var.sql_admin_password
}
