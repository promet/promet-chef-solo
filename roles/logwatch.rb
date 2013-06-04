name "logwatch"
description "Logwatch config"
run_list(
    "recipe[logwatch]",
)

default_attributes(
    :logwatch => { :email => "logwatch@promethost.com" }
)
