name "drupalops"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[database::mysql]",
    "role[ruby]",
    "role[rsyslog]",
    "role[automysqlbackup]"
)

default_attributes(
)
