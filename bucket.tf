resource "alicloud_oss_bucket" "this" {
  count            = length(var.oss_bucket)
  bucket           = lookup(var.oss_bucket[count.index], "bucket")
  logging_isenable = true
  acl              = "private"
  tags = merge(
    var.tags,
    lookup(var.buckets[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
  logging {
    target_bucket = join("-", [lookup(var.oss_bucket[count.index], "bucket"), "logging"])
  }
  versioning {
    status = "Enabled"
  }
}