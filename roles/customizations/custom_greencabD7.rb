name "custom_greencabD7"
description "GreenCab D7 customizations"
run_list(
)

override_attributes(
  "mysql" =>
   { "tunable" =>
     { "innodb_buffer_pool_size" => '512M',
       "tmp_table_size" => '64M',
       "query_cache_limit" => '4M',
       "query_cache_size" => '196M' },
    "data_dir" => 
	"/var/www/mysql" }
)
