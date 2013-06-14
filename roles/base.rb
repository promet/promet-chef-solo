name "base"
description "Base Promet Role"
run_list(
    "recipe[apt]",
    "recipe[logrotate]",
    "recipe[build-essential]",
    "role[logwatch]",
    "recipe[openssh]",
    "recipe[vim]",
    "recipe[mlocate]",
    "recipe[motd-tail]",
    "role[fail2ban]",
    "recipe[tmux]",
    "recipe[git]",
    "role[chef-client]",
    "recipe[chef_gem::ruby-shadow]",
    "recipe[sudo]",
    "recipe[postfix]",
    "role[users]",
    "recipe[ntp]"
)

default_attributes(
)
