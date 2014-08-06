name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[promet_base]",
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "role[promet_mysql]",
    "role[automysqlbackup]",
    "role[nagios-client]",
    "role[ruby]",
    "role[rsyslog]",
)

default_attributes(
)
