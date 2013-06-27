name "php"
description "PHP role"
run_list(
### OLD ->    "recipe[php]",
    "recipe[promet_php::apache2]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
### OLD ->     "recipe[php::module_apc]",
    "recipe[promet_php::module_apc]",
    "recipe[promet_php::module_mcrypt]",
    "recipe[php::module_curl]",
)

default_attributes(
  "promet_php" => { 
	"memory_limit" => "196M",
	"upload_max_filesize" => "30M",
	"post_max_size" => "10M",
	"max_execution_time" => "300",
	"max_input_time" => "300",
	"realpath_cache_size" => "64k",
	"conf_dir" => "/etc/php5/apache2",
  }
)
