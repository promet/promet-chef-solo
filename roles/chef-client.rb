name "chef-client"
description "Chef-Client Config Role"
run_list(
    "recipe[chef-client]",
    "recipe[chef-client::delete_validation]",
)

default_attributes(
)
