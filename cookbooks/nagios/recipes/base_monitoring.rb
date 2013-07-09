#
# Cookbook Name:: monitoring
# Recipe:: base_monitoring
#
# Copyright 2013, Example Company, Inc.
#
# This recipe defines the necessary NRPE commands for base system monitoring
# in Example Company Inc's Chef environment.

# Check for high load.  This check defines warning levels and attributes
nagios_nrpecheck "check_load" do
  command "#{node['nagios']['plugin_dir']}/check_load"
  warning_condition "6"
  critical_condition "10"
  action :add
end

nagios_nrpecheck "check_swap" do
  command "#{node['nagios']['plugin_dir']}/check_swap"
  warning_condition "80%"
  critical_condition "30%"
  action :add
end

# Check all non-NFS/tmp-fs disks.
nagios_nrpecheck "check_all_disks" do
  command "#{node['nagios']['plugin_dir']}/check_disk"
  warning_condition "8%"
  critical_condition "5%"
  parameters "-A -x /dev/shm -X nfs -i /boot"
  action :add
end
