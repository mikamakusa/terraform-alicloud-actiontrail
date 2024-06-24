resource "alicloud_log_project" "this" {
  count       = length(var.log_projects)
  name        = lookup(var.log_projects[count.index], "name")
  description = lookup(var.log_projects[count.index], "description")
  tags = merge(
    var.tags,
    lookup(var.log_projects[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
}