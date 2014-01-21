#
# Cookbook Name:: cm22slaves
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

directory node.cm22slaves.webroot do
  owner     'www-data'
  group     'www-data'
  recursive true
end

home = "/home/#{node.cm22slaves.machine_user}"
directory "/#{home}/.drush" do
  owner node.cm22slaves.machine_user
end

directory "#{home}/.drush/kraftwagen" do
  owner node.cm22slaves.machine_user
end

kraftwagen_archive  = "#{Chef::Config[:file_cache_path]}/kraftwagen.tar.gz"

archive_name        = ::File.basename ::URI.parse(node.cm22slaves.archive.source).path
build_id            = archive_name.split('.').first.split('_').last
cm22_archive        = "#{Chef::Config[:file_cache_path]}/#{archive_name}"

remote_file kraftwagen_archive do
  source 'https://github.com/winmillwill/kraftwagen/archive/relative-links.tar.gz'
  action :create_if_missing
end

remote_file cm22_archive do
  source node.cm22slaves.archive.source
  action :create_if_missing
end

execute "tar xzf #{kraftwagen_archive} --strip-components=1 -C #{home}/.drush/kraftwagen" do
  not_if do ::File.exists? "#{home}/.drush/kraftwagen" end
end

machine_user = node.cm22slaves.machine_user

node.cm22slaves.process.each do |machine_name|
  subdomain = node.cm22slaves.sites.send machine_name
  root = "#{node.cm22slaves.webroot}/#{subdomain}"
  directory root do
    owner     machine_user
    group     'www-data'
    recursive true
  end

  directory "#{root}/archives" do
    owner     machine_user
    group     'www-data'
  end

  git "#{root}/src" do
    user        machine_user
    group       'www-data'
    repository  'git@github.com:promet/CM22Slave'
  end

  execute "kraftwagen-setup-#{machine_name}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command 'drush kw-s'
  end

  new_build = "#{root}/builds/#{build_id}"

  execute "22cm_extract_#{machine_name}_#{build_id}" do
    command "tar xzf #{cm22_archive} -C #{new_build} --strip-components=1"
    action  :nothing
  end

  directory new_build do
    owner machine_user
    group 'www-data'
    not_if do ::File.exists? new_build end
    notifies :run, "execute[22cm_extract_#{machine_name}_#{build_id}]", :immediately
  end

  execute "kw-activate-#{machine_name}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "drush kw-activate-build builds/#{build_id}"
  end

  execute "install_cm22slave_site-#{machine_name}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "#{root}/src/tools/install.sh && touch #{root}/install.lock"
    creates "#{root}/install.lock"
  end

  execute "update_cm22slave_site-#{machine_name}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "#{root}/src/tools/update.sh #{machine_name}"
  end
end
