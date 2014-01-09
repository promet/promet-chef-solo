#
# Cookbook Name:: cm22slaves
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

node.cm22slave.sites.each do |subdomain, machine_name|
  root = "/var/www/sites/#{subdomain}.prometdev.com"

  git root do
    user        'promet'
    group       'www-data'
    repository  'git@github.com:promet/CM22Slave'
  end

  script "update_cm22slave_site-#{machine_name}" do
    user  'promet'
    cwd   root
    code  <<-SCRIPT
    drush kw-b
    cd build
    drush kw-id -y
    drush vset 'oauth_slave_master_domain' 'http://corporate22cm.prometdev.com'
    drush cc-aic -y #{machine_name} dev
    drush kw-u
    SCRIPT
  end
end
