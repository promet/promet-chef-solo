name "base-centos64"
description "Base Promet Role"
run_list(
    "recipe[yum]",
    "recipe[yum-epel]",
    "recipe[logrotate]",
    "recipe[build-essential]",
    "role[logwatch]",
    "recipe[openssh]",
    "recipe[vim]",
    "recipe[mlocate]",
    "recipe[motd-tail]",
    "recipe[tmux]",
    "recipe[git]",
    "role[chef-client]",
    "recipe[chef_gem]",
    "recipe[chef_gem::ruby-shadow]",
    "role[sudo]",
    "role[users]",
    "role[postfix]",
    "role[ssh_known_hosts]",
    "recipe[ntp]"
)
default_attributes(
  "openssh" => {
    "server" => {
      "subsystem" => "sftp /usr/lib/openssh/sftp-server"
    }
  }
)
