variable "account" {
  type        = string
  description = "Specify your snowflake account identifier assigned, by Snowflake"
}

variable "user" {
  type        = string
  description = "Specify snowflake username"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "Password for username+password auth"
  sensitive   = true
}

variable "warehouses_config_file" {
  type        = string
  description = "Path to warehouses configuration yaml file. Check Readme for examples."
  default     = ""
}

variable "warehouses" {
  type = list(object({
    name           = string
    warehouse_size = string
    comment        = optional(string)
  }))
  description = "List of warehouses. See type for the expected fileds. warehouses_config_file takes priority over warehouses if both are set."
  default     = []
}

locals {
  warehouses = var.warehouses_config_file != "" ? yamldecode(file(var.warehouses_config_file)) : var.warehouses
}
