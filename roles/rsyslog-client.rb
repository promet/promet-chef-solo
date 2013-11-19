name "rsyslog-client"
description "rsyslog-client config"
run_list(
    "recipe[promet_rsyslog]",
    "recipe[promet_rsyslog::client]"
)

default_attributes(
    :rsyslog => {  :server_search => "role:rsyslog-server",
		   :logs_to_forward => "*.*" }
)
