## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.5 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.211.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.258.0 |

## Modules

No modules.

## Examples
```hcl
module "actiontrail" {
  source         = "."
  roles          = "AliyunServiceRoleForActionTrail"
  storage_region = "cn-hangzhou"
  trails = [{
    name                  = "trail-1-example"
    event_rw              = "Read"
    is_organization_trail = true
    status                = "Enable"
    delivery_jobs         = true
  }]
  advanced_query_template = {
    exampleTemplateName = {
      simple_query = true
      template_sql = "*"
    }
  }
}
```

## Resources

| Name | Type |
|------|------|
| [alicloud_actiontrail_advanced_query_template.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/actiontrail_advanced_query_template) | resource |
| [alicloud_actiontrail_global_events_storage_region.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/actiontrail_global_events_storage_region) | resource |
| [alicloud_actiontrail_history_delivery_job.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/actiontrail_history_delivery_job) | resource |
| [alicloud_actiontrail_trail.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/actiontrail_trail) | resource |
| [alicloud_account.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_log_projects.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/log_projects) | data source |
| [alicloud_mns_topics.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/mns_topics) | data source |
| [alicloud_oss_buckets.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/oss_buckets) | data source |
| [alicloud_ram_roles.sls_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/ram_roles) | data source |
| [alicloud_ram_roles.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/ram_roles) | data source |
| [alicloud_regions.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_query_template"></a> [advanced\_query\_template](#input\_advanced\_query\_template) | n/a | <pre>map(object({<br/>    simple_query  = bool<br/>    template_sql  = string<br/>  }))</pre> | `{}` | no |
| <a name="input_buckets"></a> [buckets](#input\_buckets) | Name of the bucket used as datasource | `string` | `null` | no |
| <a name="input_log_project"></a> [log\_project](#input\_log\_project) | n/a | `string` | `null` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | Name of the role used as datasource | `string` | `null` | no |
| <a name="input_storage_region"></a> [storage\_region](#input\_storage\_region) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | `string` | `null` | no |
| <a name="input_trails"></a> [trails](#input\_trails) | n/a | <pre>list(object({<br/>    name                       = string<br/>    event_rw                   = optional(string)<br/>    oss_key_prefix             = optional(string)<br/>    role_name                  = optional(number)<br/>    status                     = optional(string)<br/>    is_organization_trail      = optional(bool)<br/>    max_compute_project_arn    = optional(string)<br/>    max_compute_write_role_arn = optional(string)<br/>    trail_region               = optional(string)<br/>    delivery_jobs              = optional(bool)<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_actiontrail_trails"></a> [actiontrail\_trails](#output\_actiontrail\_trails) | n/a |
| <a name="output_global_events_storage_regions"></a> [global\_events\_storage\_regions](#output\_global\_events\_storage\_regions) | n/a |
| <a name="output_history_delivery_jons"></a> [history\_delivery\_jons](#output\_history\_delivery\_jons) | n/a |
