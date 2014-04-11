name "nginx"
description "NGINX role"
run_list(
    "recipe[nginx]",
)

default_attributes(
)
