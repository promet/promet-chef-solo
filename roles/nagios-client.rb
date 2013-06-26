name "nagios-client"
description "nagios client roles"
run_list(
  "recipe[nagios]",
  "recipe[nagios::client]"
)

default_attributes(
  "nagios" => {
    "server_role" => "nagios-server"
  }
)