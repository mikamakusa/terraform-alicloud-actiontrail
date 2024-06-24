resource "alicloud_mns_topic" "this" {
  count                = length(var.mns_topics)
  name                 = lookup(var.mns_topics[count.index], "name")
  maximum_message_size = lookup(var.mns_topics[count.index], "maximum_message_size")
  logging_enabled      = lookup(var.mns_topics[count.index], "logging_enabled")
}