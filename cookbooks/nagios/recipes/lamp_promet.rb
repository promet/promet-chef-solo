#
# Cookbook Name:: monitoring
# Recipe:: base_monitoring
#
# Copyright 2013, Example Company, Inc.
#
# This recipe defines the necessary NRPE commands for base system monitoring
# in Example Company Inc's Chef environment.

# Check for mysql 
nagios_nrpecheck "check_mysql" do
  command "#{node['nagios']['plugin_dir']}/check_mysql"
  warning_condition "WARNING"
  critical_condition "ERROR"
  parameters "-u nagios -p pr0m3tnagi0s"
  action :add
end
