name "base"
description "Base Promet Role"
run_list(
    "recipe[apt]",
    "recipe[logrotate]",
    "recipe[build-essential]",
    "recipe[openssh]",
    "recipe[vim]",
    "recipe[mlocate]",
    "recipe[motd-tail]",
    "recipe[tmux]",
    "recipe[git]",
    "role[chef-client]",
    "recipe[chef_gem]",
    "recipe[chef_gem::ruby-shadow]",
    "role[users]",
    "role[postfix]",
    "recipe[cron]",
    "recipe[rsyslog]",
    "recipe[ntp]"
)
default_attributes(
  "build_essential" => {
    "compiletime" => true
  },
  "openssh" => {
    "server" => {
      "subsystem" => "sftp /usr/lib/openssh/sftp-server",
#      "password_authentication" => "yes",
      "permit_root_login" => "no"
    },
    "client " => {
      "protocol" => "2"
    },
  },
)
