node.cm22.slave.process.each do |name|
  slave = node.cm22.slave.sites.send name

  nginx_site slave do
    template 'nginx-slave.conf.erb'
    cookbook 'cm22'
    docroot "#{node.cm22.webroot}/#{slave}/build"
    server_aliases ["#{slave}.com"]
    server_name "www.#{slave}.com"
    allow_override "All"
  end
end

