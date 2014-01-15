name "s3fs-backup"
description "s3fs-backup using backup gem config"
run_list(
      "role[ruby]",
      "recipe[backup-cookbook::default]",
#      "recipe[backup-cookbook::wwwbackup]",
      "recipe[backup-cookbook::mysqlbackup]",
)

default_attributes(
      'backup' => {
        's3_bucket' => 'backup',
        'db_user' => 'backup',
        'db_password' => 'backup',
        'db_host' => 'localhost',
        },
)
