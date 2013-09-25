name "mysql_server"
description "MySQL server role"
run_list(
    "recipe[mysql::server]",
    "recipe[promet-tools::mytop]",
    "recipe[mysql::my_root]"
)
default_attributes(
  :mysql => {
    :bind_address => "0.0.0.0",
    :remove_anonymous_users => "true",
    :tunable => {
      :key_buffer => "256M",
      :table_cache => "4096",
      :connect_timeout => "30",
      :query_cache_size => "128M",
      :max_heap_table_size => "128M"
    }
  }
)
override_attributes(
  :mysql => {
    :server_root_password => "pr0m3tmysql",
    :server_repl_password => "replpass",
    :server_debian_password => "debianpass"
  }
)
