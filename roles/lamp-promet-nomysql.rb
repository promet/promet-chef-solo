name "lamp-promet-nomysql"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[apache2]",
    "role[php]",
    "role[nagios-client-nomysql]",
)

default_attributes(
)