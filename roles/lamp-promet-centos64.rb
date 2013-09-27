name "lamp-promet-centos64"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[base-centos64]",
    "role[apache2]",
    "role[php-centos64]",
    "role[mysql_server]",
    "role[nagios-client]",
)

default_attributes(
)
