name "drupal-nginx"
description "LNMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[nginx]",
    "role[php-nginx]",
    "recipe[drupal::drush]",
    "role[mysql_server]",
    "recipe[promet-tools::mytop]",
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[promet_database::mysql]",
    "role[ruby]",
    "role[rsyslog-client]",
    "recipe[promet_rsyslog::papertrail]",
    "role[nagios-client]",
)

default_attributes(
    :rsyslog => {
      :papertrail_dest => "logs.papertrailapp.com:43039"
    }
)
