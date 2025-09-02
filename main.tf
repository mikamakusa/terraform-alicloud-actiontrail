resource "alicloud_actiontrail_trail" "this" {
  for_each                   = { for trail in var.trails : trail.name => trail }
  trail_name                 = each.value.name
  event_rw                   = each.value.event_rw
  oss_bucket_name            = data.alicloud_oss_buckets.this.names
  oss_key_prefix             = each.value.oss_key_prefix
  sls_project_arn            = join(":", ["acs:log", data.alicloud_regions.this.id, data.alicloud_account.this.id, join("/", ["project", data.alicloud_log_projects.this.id])])
  sls_write_role_arn         = data.alicloud_ram_roles.this.0.id
  status                     = each.value.status
  is_organization_trail      = each.value.is_organization_trail
  max_compute_project_arn    = each.value.max_compute_project_arn
  max_compute_write_role_arn = each.value.max_compute_write_role_arn
  trail_region               = each.value.trail_region
  oss_write_role_arn         = data.alicloud_ram_roles.this.names
}

resource "alicloud_actiontrail_global_events_storage_region" "this" {
  count          = var.storage_region ? 1 : 0
  storage_region = var.storage_region
}

resource "alicloud_actiontrail_history_delivery_job" "this" {
  for_each   = { for trail in var.trails : trail.name => trail if contains(keys(trail), "delivery_jobs") && trail.delivery_jobs != false }
  trail_name = alicloud_actiontrail_trail.this[each.key].name
}

resource "alicloud_actiontrail_advanced_query_template" "this" {
  for_each      = var.advanced_query_template
  simple_query  = each.value.simple_query
  template_sql  = each.value.template_sql
  template_name = each.key
}