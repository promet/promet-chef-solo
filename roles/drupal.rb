name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[chef_gem::slaughter_rubies]",
    "role[automysqlbackup]"
)

default_attributes(
)
