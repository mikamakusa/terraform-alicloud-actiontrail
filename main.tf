resource "alicloud_actiontrail" "this" {
  count              = length(var.actiontrail)
  name               = lookup(var.actiontrail[count.index], "name")
  event_rw           = lookup(var.actiontrail[count.index], "event_rw")
  oss_bucket_name    = var.buckets != null ? data.alicloud_oss_buckets.this.id : element(alicloud_oss_bucket.this.*.bucket, lookup(var.actiontrail[count.index], "oss_bucket_id"))
  role_name          = element(alicloud_ram_role_policy_attachment.this.*.role_name, lookup(var.actiontrail[count.index], "role_id"))
  oss_key_prefix     = lookup(var.actiontrail[count.index], "oss_key_prefix")
  sls_project_arn    = lookup(var.actiontrail[count.index], "sls_project_arn")
  sls_write_role_arn = lookup(var.actiontrail[count.index], "sls_write_role_arn")
}

resource "alicloud_actiontrail_global_events_storage_region" "this" {
  count          = var.storage_region ? 1 : 0
  storage_region = var.storage_region
}

resource "alicloud_actiontrail_history_delivery_job" "this" {
  count      = length(var.delivery_job)
  trail_name = element(alicloud_actiontrail.this.*.name, lookup(var.delivery_job[count.index], "trail_id"))
}

resource "alicloud_actiontrail_trail" "this" {
  count                 = length(var.trail)
  trail_name            = lookup(var.trail[count.index], "trail_name")
  event_rw              = lookup(var.trail[count.index], "event_rw")
  oss_bucket_name       = element(alicloud_oss_bucket.this.*.bucket, lookup(var.trail[count.index], "bucket_id"))
  oss_key_prefix        = lookup(var.trail[count.index], "oss_key_prefix")
  role_name             = element(alicloud_ram_role.this.*.name, lookup(var.trail[count.index], "role_id"))
  sls_project_arn       = join(":", ["acs:log", data.alicloud_regions.this.id, data.alicloud_account.this.id, join("/", ["project", var.log_project != null ? data.alicloud_log_projects.this.id : element(alicloud_log_project.this.*.name, lookup(var.trail[count.index], "sls_project_id"))])])
  sls_write_role_arn    = var.log_project ? data.alicloud_ram_roles.sls_role.id : element(alicloud_ram_role.this.*.id, lookup(var.trail[count.index], "role_id"))
  mns_topic_arn         = var.topics ? data.alicloud_mns_topics.this.id : element(alicloud_mns_topic.this.*.name, lookup(var.trail[count.index], "mns_topic_id"))
  status                = lookup(var.trail[count.index], "status")
  is_organization_trail = lookup(var.trail[count.index], "is_organization_trail")
}