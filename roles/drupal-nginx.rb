name "drupal-nginx"
description "LNMP Stack base role for Promet servers"
run_list(
    "role[base]",
    "role[nginx]",
    "role[php-nginx]",
    "recipe[drupal::drush]",
    "role[mysql_server]",
    "recipe[promet_mysql::my_root]",
    "recipe[promet_database::nagios_user]",
    "recipe[promet_database::mysql]",
    "role[ruby]",
    "role[rsyslog]",
    "role[cronapt]",
    "role[nagios-client]",
    "role[automysqlbackup]",
    "role[s3fs-backup]",
    "role[slaughtered]",
)

default_attributes(
)
