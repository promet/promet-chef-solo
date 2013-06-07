name "monit"
description "Monit config"
run_list(
    "recipe[monit]",
    "recipe[monit::postfix]",
    "recipe[monit::ssh]",
)

default_attributes(
)
