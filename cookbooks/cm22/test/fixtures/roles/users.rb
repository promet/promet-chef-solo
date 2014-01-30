name "users"
description "Promet Users Role"
run_list(
    "recipe[users]",
    "recipe[users::promet_user]",
)

default_attributes(
)
