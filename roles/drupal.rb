name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[promet-tools::mytop]",
    "recipe[mysql::my_root]",
    "recipe[database::nagios_user]",
    "recipe[database::mysql]",
    "role[automysqlbackup]",
    "role[ruby]",
    "recipe[promet_rsyslog::papertrail]",
)

default_attributes(
    :rsyslog => {
      :papertrail_dest => "logs.papertrailapp.com:43039"
    }
)
