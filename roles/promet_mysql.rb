name "promet_mysql"
description "MySQL server Promet Things"
run_list(
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[promet_database::mysql]",
)
default_attributes(
)
