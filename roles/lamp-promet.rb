name "lamp-promet"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[apache2]",
    "role[php]",
    "role[mysql_server]",
)

default_attributes(
)
