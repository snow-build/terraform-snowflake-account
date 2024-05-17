variable "account" {
  type = string
}

variable "user" {
  type = string
}

variable "password" {
  type = string
}

variable "warehouses" {
  type = list(object({
    name           = string
    warehouse_size = string
    comment        = optional(string)
  }))
}
