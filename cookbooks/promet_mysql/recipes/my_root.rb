# Mysql root user auth

template "/root/.my.cnf" do
    source "root.my.cnf.erb"
    owner "root"
    group node['mysql']['root_group']
    mode "0600"
end
