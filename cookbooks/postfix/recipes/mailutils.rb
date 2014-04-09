# Author:: Greg Palmier
# Cookbook Name:: postfix
# Recipe:: mailutils 

case node['platform_family']
when 'rhel', 'fedora'
  package 'bind-utils' do
    action :install
  end
when 'debian'
  package 'mailutils' do
    action :install
  end
end
