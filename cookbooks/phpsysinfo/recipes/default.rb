#
# Cookbook Name:: phpsysinfo
# Recipe:: default
#
# Copyright 2013, gregpalmier
#
# All rights reserved - Redistribute
#

# Require Apache 

# Create the apache config to add to the default page
template "/etc/apache2/conf.d/phpsysinfo.conf" do
 source "phpsysinfo.conf.erb"
 owner "root"
 group 0
 mode 00644
end

# Now Add the phpinfo.php file
cookbook_file "/var/www/phpinfo.php" do
  source "phpinfo.php"
  mode 0755
  owner "root"
  group "root"
  action :create_if_missing
end
