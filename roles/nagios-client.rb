name "nagios-client"
description "nagios client roles"
run_list(
  "recipe[nagios]",
  "recipe[nagios::client]",
  "recipe[nagios::base_monitoring]",
  "recipe[nagios::lamp_promet]",
)

default_attributes(
  "nagios" => {
    "server_role" => "nagios-server",
    "multi_environment_monitoring" => "true"
  }
)
