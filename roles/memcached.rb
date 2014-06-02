name "memcached"
description "memcached base config"
run_list(
    "recipe[memcached]"
)

default_attributes(
  {
   "memcached" => {
     "user" => "www-data"
    }
  }
)
