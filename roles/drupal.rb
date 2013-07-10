name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "role[nagios-client]",
    "role[automysqlbackup]"
)

default_attributes(
)
