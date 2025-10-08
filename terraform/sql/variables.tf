variable "name_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "primary_location" { type = string }
variable "secondary_location" { type = string }
variable "admin_login" { type = string }
variable "admin_password" { type = string  sensitive = true }
