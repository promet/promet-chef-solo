cookbook_file "/home/promet/.ssh/id_rsa" do
 source "keys/gitolite_promet"
 owner "promet"
 group "dev"
 mode 0600
 action :create
end
