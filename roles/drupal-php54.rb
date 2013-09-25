name "drupal-php54"
description "LAMP Stack base role for Promet servers using PHP 5.4"
run_list(
    "role[lamp-promet-php54]",
    "recipe[drupal::drush]",
    "role[automysqlbackup]"
)

default_attributes(
)
