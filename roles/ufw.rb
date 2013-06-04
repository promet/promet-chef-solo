name "ufw"
description "UFW"
run_list(
    "recipe[firewall]",
    "recipe[ufw]"
)

default_attributes(
)
