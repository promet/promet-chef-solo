name "promet_base"
description "Base Promet Role"
run_list(
    "role[logwatch]",
    "role[fail2ban]",
    "role[users]",
    "recipe[promet_ssh_known_hosts::github]",
    "recipe[promet-tools::gregwants]",
    "recipe[promet-tools::mytop]",
    "recipe[promet-tools::github]",
    "role[newrelic]",
    "recipe[timezone-ii]",
    "recipe[omnibus_updater]",
)
default_attributes(
  "tz" => "America/Chicago",
  "omnibus_updater" => {
# see environments for enabling
    "disabled" => true
  }
)
