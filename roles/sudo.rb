name "sudo"
description "sudo config"
run_list(
    "recipe[sudo]",
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["ops"],
      "include_sudoers_d" => true,
      "passwordless" => true
    }
  }
)
