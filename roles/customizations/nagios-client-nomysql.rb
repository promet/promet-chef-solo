name "nagios-client-nomysql"
description "nagios client roles for no MySQL servers"
run_list(
  "recipe[nagios]",
  "recipe[nagios::client]",
  "recipe[nagios::base_monitoring]",
  "recipe[nagios::lamp_promet]",
#  "recipe[database::nagios_user]",
)

default_attributes(
  "nagios" => {
    "server_role" => "nagios-server",
    "multi_environment_monitoring" => "true"
  }
)
