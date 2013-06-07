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
    "recipe[chef-client::delete_validation]",
    "recipe[chef_gem::ruby-shadow]",
    "recipe[sudo]",
    "recipe[users]",
    "recipe[users::sysadmins]",
    "recipe[ntp]"
)

default_attributes(
)
