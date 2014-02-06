name "custom_22ndcentury"
description "22nd Century customizations"
run_list(
)

override_attributes(
  "mysql" =>
     { "tunable" =>
       { "innodb_buffer_pool_size" => '512M',
         "tmp_table_size" => '64M',
         "query_cache_limit" => '4M',
         "query_cache_size" => '196M' 
       }
     },
   "promet_php" => 
     { "apc" => 
       { "shm_size" => '256'
       },
     "memory_limit" => "512M",
   }
)
