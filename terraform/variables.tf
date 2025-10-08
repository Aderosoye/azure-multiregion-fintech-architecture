variable "app_name" { type = string }
variable "resource_group_name" { type = string }
variable "primary_location" { type = string }
variable "secondary_location" { type = string }
variable "appservice_sku" { type = string  default = "P1v3" }
variable "sql_admin_login" { type = string }
variable "sql_admin_password" { type = string  sensitive = true }
