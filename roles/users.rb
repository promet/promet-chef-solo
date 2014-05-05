name "users"
description "Promet Users Role"
run_list(
    "recipe[users]",
    "recipe[promet_users::dev]",
    "recipe[promet_users::sysadmins]",
    "recipe[promet_users::www-data]",
    "recipe[users::promet_user]",
    "recipe[promet_users::remove_users]",
    "recipe[promet_sudo]",
    "recipe[promet_sudo::dev]",
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["sysadmin"],
      "include_sudoers_d" => true,
      "passwordless" => true
    }
  }
)
