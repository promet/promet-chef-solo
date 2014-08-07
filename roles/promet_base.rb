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
)
default_attributes(
  "tz" => "America/Chicago",
)
