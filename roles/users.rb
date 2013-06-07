name "users"
description "Promet Users Role"
run_list(
    "recipe[users]",
    "recipe[users::dev]",
    "recipe[users::ops]",
    "recipe[users::www-data]",
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["ops"],
      "passwordless" => true
    }
  }
)
