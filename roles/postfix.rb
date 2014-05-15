name "postfix"
description "Postfix config"
run_list(
    "recipe[postfix]",
    "recipe[promet_postfix::mailutils]"
)

default_attributes(
)
