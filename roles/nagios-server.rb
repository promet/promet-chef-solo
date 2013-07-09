name "nagios-server"
description "Nagios Monitoring server"
run_list(
  "role[base]",
  "recipe[nagios]",
  "recipe[nagios::server]",
  "recipe[nagios::base_monitoring]"
)

default_attributes(
  "nagios" => { 
    "server_auth_method" => "htauth",
    "server_role" => "nagios-server",
    "notifications_enabled" => "1",
    "users_databag_group" => "ops"
  }
)
