name "logrotate"
description "Logrotate config"
run_list(
    "recipe[logrotate]",
)

default_attributes(
    #:logwatch => { :email => "tintinmonitor@gmail.com" }
)
