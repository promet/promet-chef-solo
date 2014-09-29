#
# Cookbook Name:: promet-tools
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
include_recipe 'ssh_known_hosts'
ssh_known_hosts_entry 'github.com'
