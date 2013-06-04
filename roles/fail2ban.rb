name "fail2ban"
description "Fail2Ban config"
run_list(
    "recipe[fail2ban]",
)

default_attributes(
    :fail2ban => { :email => "tintinmonitor@gmail.com" }
)
