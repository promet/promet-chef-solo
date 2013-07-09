#
# Cookbook Name:: monitoring
# Recipe:: check_apt 
#
# Copyright 2013, Promet Solutions, Inc.
#
# This recipe defines the necessary NRPE commands for base system monitoring
# in Promet Solutions, Inc's Chef environment.

# Check for high load.  This check defines warning levels and attributes
nagios_nrpecheck "check_apt" do
  command "#{node['nagios']['plugin_dir']}/check_apt"
  action :add
end

