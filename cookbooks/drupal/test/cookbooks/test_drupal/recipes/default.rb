#
# Cookbook Name:: test_drupal
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node.override.build_essential.compiletime = true
include_recipe 'build-essential'
include_recipe 'apache2'
include_recipe 'apache2::mod_php5'
package 'curl'
