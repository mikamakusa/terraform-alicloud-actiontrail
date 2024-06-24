resource "alicloud_ram_role" "this" {
  count                = length(var.ram_roles)
  name                 = lookup(var.ram_roles[count.index], "name")
  services             = lookup(var.ram_roles[count.index], "services")
  ram_users            = lookup(var.ram_roles[count.index], "ram_users")
  version              = lookup(var.ram_roles[count.index], "version")
  document             = lookup(var.ram_roles[count.index], "document")
  description          = lookup(var.ram_roles[count.index], "description")
  force                = lookup(var.ram_roles[count.index], "force")
  max_session_duration = lookup(var.ram_roles[count.index], "max_session_duration")
}

resource "alicloud_ram_policy" "this" {
  count       = length(var.ram_policy)
  policy_name = lookup(var.ram_policy[count.index], "policy_name")
  dynamic "statement" {
    for_each = lookup(var.ram_policy[count.index], "statement") == null ? [] : ["statement"]
    content {
      resource = lookup(statement.value, "resource")
      action   = lookup(statement.value, "action")
      effect   = lookup(statement.value, "effect")
    }
  }
  version         = lookup(var.ram_policy[count.index], "version")
  description     = lookup(var.ram_policy[count.index], "description")
  rotate_strategy = lookup(var.ram_policy[count.index], "rotate_strategy")
  force           = lookup(var.ram_policy[count.index], "force")
}

resource "alicloud_ram_role_policy_attachment" "this" {
  count       = length(var.role_policy_attachement)
  policy_name = element(alicloud_ram_policy.this.*.name, lookup(var.role_policy_attachement[count.index], "policy_id"))
  policy_type = element(alicloud_ram_policy.this.*.type, lookup(var.role_policy_attachement[count.index], "policy_id"))
  role_name   = element(alicloud_ram_role.this.*.name, lookup(var.role_policy_attachement[count.index], "role_id"))
}