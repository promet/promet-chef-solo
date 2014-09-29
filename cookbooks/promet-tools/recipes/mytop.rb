#
# Cookbook Name:: promet-tools
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
package "mytop" do
  action :install
end
