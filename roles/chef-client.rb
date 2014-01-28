name "chef-client"
description "Chef-Client Config Role"
run_list(
    "recipe[promet-chef-client]",
    "recipe[chef-client::delete_validation]",
    "recipe[promet-chef-client::cron]",
)

default_attributes(
)
