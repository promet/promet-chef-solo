name "drupalops"
description "LAMP Stack base role for Promet servers"
#needs debian 7
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[promet-tools::mytop]",
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[database::mysql]",
    "role[ruby]",
    "role[promet_rsyslog::papertrail]",
    "role[automysqlbackup]"
)

default_attributes(
    :rsyslog => {
      :papertrail_dest => "logs.papertrailapp.com:43039"
    }
)
