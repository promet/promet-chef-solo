name "automysqlbackup"
description "AutoMySQLBackup Snapshot routine"
run_list(
    "recipe[automysqlbackup]"
)

default_attributes(
  :automysqlbackup => {
    :mysql_user => "automysqlbackup", 
    :mysql_password => "lohLoth6",
    :backup_dir => "/var/www/mysql_backups",
    :mail_address => "logs@promethost.com" 
  }
)
