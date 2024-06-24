run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "actiontrail_trail" {
  command = [init,plan,apply]

  variables {
    log_projects = [
      {
        id = 0
        name = "actiontrail-logs"
      }
    ]
    oss_bucket = [
      {
        id = 0
        bucket = "actiontrail-bucket"
      },
      {
        id = 1
        bucket = "actiontrail-bucket-logging"
      }
    ]
    ram_roles = [
      {
        id = 0
        name = "ServiceRoleForActiontrail"
      }
    ]
    trail = [
      {
        id = 0
        trail_name = "trail1"
        oss_bucket_id = 0
      }
    ]
    delivery_job = [
      {
        id = 0
        trail_id = 0
      }
    ]
  }
}