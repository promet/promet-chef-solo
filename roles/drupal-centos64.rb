name "drupal-centos64"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet-centos64]",
    "recipe[drupal::drush]",
    "role[automysqlbackup]"
)

default_attributes(
)
