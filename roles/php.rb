name "php"
description "PHP role"
run_list(
    "recipe[php]",
    "recipe[php::module_mysql]",
    "recipe[php::module_gd]",
    "recipe[php::module_memcache]",
    "recipe[php::module_curl]",
)

default_attributes(
)
