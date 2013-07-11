name "nagios-client"
description "nagios client roles"
run_list(
  "recipe[nagios]",
  "recipe[nagios::client]",
  "recipe[nagios::base_monitoring]",
  "recipe[nagios::lamp_promet]",
  "recipe[database::mysql]",
  "recipe[database::nagios_user]"
)

default_attributes(
  "nagios" => {
    "server_role" => "nagios-server"
  }
)
