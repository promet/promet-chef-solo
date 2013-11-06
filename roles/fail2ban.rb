name "fail2ban"
description "Fail2Ban config"
run_list(
    "recipe[fail2ban]"
)

default_attributes(
    :fail2ban => { :email => "sysadmins@prometsource.com",
    		   :ignoreip => "127.0.0.1/8,98.206.35.67/32,184.172.49.213/32,166.78.144.95/32",
    		   :mta => "mail",
     		   :bantime => "3600" }
)
