name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[promet-tools::mytop]",
    "recipe[mysql::my_root]",
    "recipe[database::nagios_user]",
    "recipe[database::mysql]",
    "role[automysqlbackup]"
)

default_attributes(
)
