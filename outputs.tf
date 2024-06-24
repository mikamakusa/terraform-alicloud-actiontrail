output "actiontrails" {
  value = try(alicloud_actiontrail.this.*.id)
}

output "global_events_storage_regions" {
  value = try(alicloud_actiontrail_global_events_storage_region.this.*.id)
}

output "history_delivery_jons" {
  value = try(alicloud_actiontrail_history_delivery_job.this.*.id)
}

output "actiontrail_trails" {
  value = try(alicloud_actiontrail_trail.this.*.id)
}