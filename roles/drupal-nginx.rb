name "drupal-nginx"
description "LNMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[nginx]",
    "role[php-nginx]",
    "recipe[drupal::drush]",
    "role[mysql_server]",
    "role[promet_mysql]",
    "role[ruby]",
    "role[rsyslog]",
    "role[cronapt]",
    "role[nagios-client]",
    "role[automysqlbackup]",
    "role[slaughtered]",
)

default_attributes(
)
