name "slaughtered"
description "Adds a list of rubies that are needed for Slaughtered Sites"
run_list(
    "recipe[chef_gem::slaughter_rubies]"
)

default_attributes(
)
