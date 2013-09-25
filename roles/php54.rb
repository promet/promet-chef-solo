name "php54"
description "PHP 5.4 role"
run_list(
    "recipe[php::source]",
    "recipe[promet_php::apache2]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
    "recipe[promet_php::module_apc]",
    "recipe[promet_php::module_mcrypt]",
    "recipe[php::module_curl]"
)

default_attributes(
  :php => {
    :install_method => 'source',
    :version => '5.4.20',
    :checksum => '33da252e919715492769cdddb9c999080cfd84a0b432f10f197bc950cb02da09',
  },
  :promet_php => { 
    :memory_limit => "196M",
    :upload_max_filesize => "30M",
    :post_max_size => "10M",
    :max_execution_time => "300",
    :max_input_time => "300",
    :realpath_cache_size => "64k",
    :conf_dir => "/etc/php5/apache2",
    :apc => { "shm_size" => "96M" }
  }
)
