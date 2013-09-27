name "php-centos64"
description "PHP role for CentOS 6.4"
run_list(
# All promet_php cookbook need to accommodate yUM
#    "recipe[php::apache2]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
    "recipe[php::module_apc]",
    # This needs to be flexed to include YUM because it's not part of contrib php Cookbook
    #"recipe[php::module_mcrypt]",
    "recipe[php::module_curl]"
)

default_attributes(
  "promet_php" => { 
#	"memory_limit" => "196M",
#	"upload_max_filesize" => "30M",
#	"post_max_size" => "10M",
#	"max_execution_time" => "300",
#	"max_input_time" => "300",
#	"realpath_cache_size" => "64k",
#	"conf_dir" => "/etc/php5/apache2",
  }
)
