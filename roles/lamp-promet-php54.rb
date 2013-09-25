name "lamp-promet-php54"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[apache2]",
    "role[php54]",
    "role[mysql_server]",
    "role[nagios-client]",
)

default_attributes(
)
