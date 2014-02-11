#
# Cookbook Name:: cm22
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

composer '/usr/local/bin' do
  owner node.cm22.machine_user
  action [:install, :update]
end

directory node.cm22.webroot do
  owner     node.cm22.httpd_group
  group     node.cm22.httpd_group
  recursive true
end

home = "/home/#{node.cm22.machine_user}"
directory "/#{home}/.drush" do
  owner node.cm22.machine_user
end

directory "#{home}/.drush/kraftwagen" do
  owner node.cm22.machine_user
end

kraftwagen_archive  = "#{Chef::Config[:file_cache_path]}/kraftwagen.tar.gz"

remote_file kraftwagen_archive do
  source 'https://github.com/winmillwill/kraftwagen/archive/relative-links.tar.gz'
  action :create_if_missing
end

execute "tar xzf #{kraftwagen_archive} --strip-components=1 -C #{home}/.drush/kraftwagen" do
  not_if do ::File.exists? "#{home}/.drush/kraftwagen/kraftwagenrc.php" end
end

execute "drush cc drush" do
  user        node.cm22.machine_user
  environment({'HOME' => home})
end

node.cm22.slave.process.each do |machine_name|
  sub = node.cm22.slave.sites.send machine_name
  item = data_bag_item('drupal', node.cm22.slave.base_data_bag_item).to_hash
  item['databases']['default']['default']['database'] ||= "#{sub}DB"
  env = item['environment'] || 'staging'
  cm22_site sub do
    machine_name  machine_name
    archive_url   node.cm22.slave.archive.source
    machine_user  node.cm22.machine_user
    root          "#{node.cm22.webroot}/#{sub}"
    command       "src/tools/update.sh -e #{env} -n #{machine_name}"
    git_repo      node.cm22.slave.git_repo
    git_ref       node.cm22.slave.git_ref
    config        item
  end
end

node.cm22.master.process.each do |sub|
  item = data_bag_item('drupal', node.cm22.master.base_data_bag_item).to_hash
  env = item['environment'] || 'staging'
  cm22_site sub do
    subdomain     sub
    archive_url   node.cm22.master.archive.source
    machine_user  node.cm22.machine_user
    root          "#{node.cm22.webroot}/#{sub}"
    command       "src/tools/update.sh -e #{env}"
    git_repo      node.cm22.master.git_repo
    git_ref       node.cm22.master.git_ref
    config        item
  end
end
