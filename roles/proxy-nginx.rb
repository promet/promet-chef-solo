name "proxy-nginx"
description "Nginx Proxyrole for Promet servers"
run_list(
    "role[base]",
    "role[nginx]",
    "recipe[promet_nginx::proxy_path]",
    "role[php-nginx]",
    "role[ruby]",
    "role[rsyslog]",
    "role[cronapt]",
    "role[nagios-client]",
)

default_attributes(
)
