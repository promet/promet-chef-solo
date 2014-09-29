#
# Cookbook Name:: promet_apache2-cookbook
# Recipe:: default
#
# Copyright (C) 2013 gregpalmier
# 
# All rights reserved - Redistribute
#

include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_deflate"
include_recipe "apache2::mod_status"
include_recipe "apache2::mod_headers"
