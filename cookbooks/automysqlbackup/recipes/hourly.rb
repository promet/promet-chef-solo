# Cookbook Name:: automysqlbackup 
# Recipe:: hourly

include_recipe "automysqlbackup"

cron "automysqlbackup" do
  minute "05"
  hour "*"
  day "*"
  month "*"
  weekday "*"
  command "/usr/local/sbin/automysqlbackup.sh"
end
