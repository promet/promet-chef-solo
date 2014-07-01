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
    "role[users]",
    "role[postfix]",
    "recipe[promet_ssh_known_hosts::github]",
    "recipe[promet-tools::gregwants]",
    "recipe[promet-tools::mytop]",
    "recipe[promet-tools::github]",
    "role[newrelic]",
    "role[cronapt]",
    "recipe[cron]",
    "recipe[rsyslog]",
    "recipe[timezone-ii]",
    "recipe[omnibus_updater]",
    "recipe[ntp]"
)
#default['openssh']['server']['subsystem']
default_attributes(
  "build_essential" => {
    "compiletime" => true
  },
  "tz" => "America/Chicago",
  "openssh" => {
    "server" => {
      "subsystem" => "sftp /usr/lib/openssh/sftp-server",
#      "password_authentication" => "no",
      "permit_root_login" => "no"
    },
    "client " => {
      "protocol" => "2"
    },
  },
  "omnibus_updater" => {
# see environments for enabling
    "disabled" => true,
    "version" => '11.12.2-1'
  }
)
