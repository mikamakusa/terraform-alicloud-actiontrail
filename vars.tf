variable "buckets" {
  type        = string
  default     = null
  description = <<-EOT
    Name of the bucket used as datasource
  EOT
}

variable "roles" {
  type        = string
  default     = null
  description = <<-EOT
    Name of the role used as datasource
EOT
}

variable "topics" {
  type    = string
  default = null
}

variable "log_project" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "storage_region" {
  type    = string
  default = null
}

variable "trails" {
  type = list(object({
    name                       = string
    event_rw                   = optional(string)
    oss_key_prefix             = optional(string)
    role_name                  = optional(number)
    status                     = optional(string)
    is_organization_trail      = optional(bool)
    max_compute_project_arn    = optional(string)
    max_compute_write_role_arn = optional(string)
    trail_region               = optional(string)
    delivery_jobs              = optional(bool)
  }))
}

variable "advanced_query_template" {
  type = map(object({
    simple_query  = bool
    template_sql  = string
  }))
  default = {}
}