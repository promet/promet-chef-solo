name "monit"
description "Monit config"
run_list(
    "recipe[monit]",
    "recipe[monit::postfix]",
    "recipe[monit::ssh]",
)

default_attributes(
	:monit => { :notify_email => "sysadmins@promethost.com" }
)
