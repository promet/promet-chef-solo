node.cm22.slave.process.each do |name|
  slave = node.cm22.slave.sites.send name

  web_app slave do
    template 'web_app.conf.erb'
    cookbook 'apache2'
    docroot "#{node.cm22.webroot}/#{slave}/build"
    server_aliases ["#{slave}.com"]
    server_name "www.#{slave}.com"
    allow_override "All"
  end
end

web_app '22ndcenturymedia' do
  template 'web_app.conf.erb'
  cookbook 'cm22'
  docroot "#{node.cm22.webroot}/cm22master/build"
  server_aliases ["22ndcenturymedia.com"]
  server_name "www.22ndcenturymedia.com"
  allow_override "All"
end
