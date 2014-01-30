#
# Cookbook Name:: test_cm22
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef-solo-search"
include_recipe "ssh_known_hosts"
include_recipe "users"
include_recipe "users::dev"
include_recipe "users::promet_user"
