name "php"
description "PHP role"
run_list(
    "recipe[promet_php::apache2]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
    "recipe[promet_php::module_apc]",
    "recipe[promet_php::module_mcrypt]",
    "recipe[php::module_curl]",
    "role[composer]"
)

default_attributes(
  "promet_php" => {
    "memory_limit" => "196M",
    "upload_max_filesize" => "30M",
    "post_max_size" => "10M",
    "expose_php" => "Off",
    "max_execution_time" => "300",
    "max_input_time" => "300",
    "realpath_cache_size" => "64k",
    "date_timezone" => "America/Chicago",
    "conf_dir" => "/etc/php5/apache2",
    "apc" => {
      "enable_cli" => "0"
    }
  }
)
