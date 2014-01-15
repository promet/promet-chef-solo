#
# Cookbook Name:: cm22slaves
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

node.cm22slave.sites.each do |machine_name, subdomain|
  root = "/var/www/sites/twenty_second/#{subdomain}"

  git "#{root}/src" do
    user        'promet'
    group       'www-data'
    repository  'git@github.com:promet/CM22Slave'
  end

  bash "update_cm22slave_site-#{machine_name}" do
    user  'promet'
    cwd   root
    code  <<-SCRIPT
    drush kw-b
    cd build
    drush vset 'oauth_slave_master_domain' 'http://corporate22cm.prometstaging.com'
    drush cc-aic -y #{machine_name} staging
    drush kw-u
    drush cc-aic -y #{machine_name} staging
    SCRIPT
  end
end
