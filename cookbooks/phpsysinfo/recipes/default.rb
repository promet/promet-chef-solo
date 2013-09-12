#
# Cookbook Name:: phpsysinfo
# Recipe:: default
#
# Copyright 2013, gregpalmier
#
# All rights reserved - Redistribute
#

# Require Apache 

bash "create_sitedir" do
 user "root"
 code <<-EOH
 mkdir -p /var/www/promet
 EOH
end

# A basic phpinfo.php file
cookbook_file "/var/www/promet/phpinfo.php" do
  source "phpinfo.php"
  mode 0644
  owner "root"
  group "www-data"
  action :create
end

# Clone the phpsysinfo repo from GitHub and put it under the
# default apache vhost location (under an assumption here, yes)
git "/var/www/promet/phpsysinfo" do
   repository "https://github.com/rk4an/phpsysinfo.git"
   user "root"
   group "www-data"
   action :checkout
end

# Create the phpsysinfo.ini file (defaults, or it would
# be a templated thing with attributes)
cookbook_file "/var/www/promet/phpsysinfo/phpsysinfo.ini" do
  source "phpsysinfo.ini"
  mode 0644
  owner "root"
  group "www-data"
  action :create
end

# Update the index.html file to include a link to the 
# php info pages
cookbook_file "/var/www/index.html" do
  source "index.html"
  mode 0644
  owner "root"
  group "www-data"
  action :create
end

# add basic demo / demo credentials
cookbook_file "/var/www/promet/.htpasswd" do
  source "htpasswd"
  mode 0644
  owner "root"
  group "www-data"
  action :create
end

template "/etc/apache2/conf.d/phpsysinfo.conf" do
 source "phpsysinfo.conf.erb"
 owner "root"
 group 0
 mode 00644
 notifies :restart, "service[apache2]"
end
