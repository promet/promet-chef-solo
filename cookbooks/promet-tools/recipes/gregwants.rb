#
# Cookbook Name:: promet-tools
# Recipe:: gregwants
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
%w{elinks htop tree sysv-rc-conf dnsutils apt-show-versions mailutils}.each do |pkg|
  package pkg do
    action :upgrade
  end
end
