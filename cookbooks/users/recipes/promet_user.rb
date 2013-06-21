cookbook_file "/home/promet/.ssh/gitolite_promet" do
 source "keys/gitolite_promet"
 owner "promet"
 group "dev"
 mode 0600
end
