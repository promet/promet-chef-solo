name "drupal"
description "LAMP Stack base role for Promet servers"
run_list(
    "role[lamp-promet]",
    "recipe[drupal::drush]",
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[promet_database::mysql]",
    "role[automysqlbackup]",
    "role[nagios-client]",
    "role[ruby]",
    "role[rsyslog-client]",
    "recipe[promet_rsyslog::papertrail]",
)

default_attributes(
    :rsyslog => {
      :papertrail_dest => "logs.papertrailapp.com:43039"
    }
)
