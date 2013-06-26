name "munin-client"
description "munin client config"
run_list(
    "recipe[munin]",
    "recipe[munin::client]"
)

default_attributes(
    :munin => { :sysadmin_email => "greg@promethost.com" }
)
