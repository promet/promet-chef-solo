name "nagios-server"
description "Nagios Monitoring server"
run_list(
  "role[base]",
  "recipe[nagios]",
  "recipe[nagios::server]"
)

default_attributes(
  "nagios" => { 
    "server_auth_method" => "htauth",
    "server_role" => "nagios-server",
    "users_databag_group" => "ops"
  }
)
