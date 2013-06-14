name "postfix"
description "Postfix config"
run_list(
    "recipe[postfix]"
    "recipe[postfix::mailutils]"
)

default_attributes(
)
