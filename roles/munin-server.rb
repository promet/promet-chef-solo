name "munin-server"
description "munin server config"
run_list(
    "role[base]",
    "recipe[munin]",
    "recipe[munin::server]"
)

default_attributes(
    :munin => { :sysadmin_email => "greg@promethost.com" }
)
