provider "snowflake" {
  alias    = "sysadmin"
  account  = var.account
  user     = var.user
  password = var.password
  role     = "SYSADMIN"
}

resource "snowflake_warehouse" "all_warehouses" {
  provider       = snowflake.sysadmin
  for_each       = { for idx, wh in local.warehouses : wh.name => wh }
  name           = each.value.name
  warehouse_size = each.value.warehouse_size
  comment        = can(each.value.comment) ? each.value.comment : null
}

