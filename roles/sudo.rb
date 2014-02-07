name "sudo"
description "sudo config"
run_list(
    "recipe[promet_sudo]",
    "recipe[promet_sudo::dev]",
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["ops","sysadmin"],
      "include_sudoers_d" => true,
      "passwordless" => true
    }
  }
)
