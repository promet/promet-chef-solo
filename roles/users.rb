name "users"
description "Promet Users Role"
run_list(
    "recipe[users]",
    "recipe[users::dev]",
    "recipe[users::ops]",
    "recipe[users::sysadmins]",
    "recipe[users::www-data]",
    "recipe[users::promet_user]"
)

default_attributes(
)
