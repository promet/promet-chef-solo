name "rsyslog"
description "rsyslog with papertrail config"
run_list(
    "recipe[rsyslog]",
    "role[ruby]",
    "recipe[promet_rsyslog::papertrail]"
)

default_attributes(
  "rsyslog" => {
      "papertrail_dest" => "logs.papertrailapp.com:43039",
      "high_precision_timestamps" => "on",
      "preserve_fqdn" => "on",
  }
)
