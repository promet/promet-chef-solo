name "nginx"
description "NGINX role"
run_list(
    "recipe[nginx]",
)

default_attributes(
  :nginx => {
    :server_tokens => "off",
    :default_site_enabled => false,
    :keepalive_timeout => 15,
    :proxy_read_timeout => 20,
    :worker_connections => 5000,
  }
)
