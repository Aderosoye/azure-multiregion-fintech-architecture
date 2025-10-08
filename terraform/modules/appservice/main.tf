resource "azurerm_app_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = "App"
  sku {
    tier = "PremiumV3"
    size = var.sku_name
  }
}

resource "azurerm_app_service" "app" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.asp.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    minimum_tls_version = "1.2"
    ftps_state          = "Disabled"
  }
}

output "app_name" {
  value = azurerm_app_service.app.name
}
