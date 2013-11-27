name "rsyslog-server"
description "rsyslog-server config"
run_list(
    "recipe[promet_rsyslog]",
    "recipe[promet_rsyslog::server]"
)

default_attributes(
    :rsyslog => { :server => "true",
     		  :log_dir => "/srv/logs",
     		  :preserve_fqdn => "on",
     		  :server_search => "role:rsyslog-server",
     		  :per_host_dir => "%HOSTNAME%"
      }
)
