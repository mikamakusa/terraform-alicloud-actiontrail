data "alicloud_regions" "this" {
  current = true
}

data "alicloud_account" "this" {}

data "alicloud_ram_roles" "this" {
  name_regex = var.roles
}

data "alicloud_oss_buckets" "this" {
  name_regex = var.buckets
}

data "alicloud_mns_topics" "this" {
  name_prefix = var.topics
}

data "alicloud_ram_roles" "this" {
  name_regex = var.log_project
}

data "alicloud_log_projects" "this" {
  name_regex = var.log_project
}
