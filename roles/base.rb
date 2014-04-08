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
    "recipe[chef_gem]",
    "recipe[chef_gem::ruby-shadow]",
    "role[sudo]",
    "role[users]",
    "role[postfix]",
    "role[ssh_known_hosts]",
    "recipe[promet-tools]",
    "recipe[promet-tools::gregwants]",
    "role[newrelic]",
    "role[cronapt]",
    "recipe[cron]",
    "recipe[ntp]"
)
#default['openssh']['server']['subsystem']
default_attributes(
  "build_essential" => {
    "compiletime" => true
  },
  "openssh" => {
    "server" => {
      "subsystem" => "sftp /usr/lib/openssh/sftp-server",
#      "password_authentication" => "no",
      "permit_root_login" => "no"
    },
    "client " => {
      "protocol" => "2"
    }
  }
)
