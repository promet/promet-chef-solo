cookbook_file "/home/promet/.ssh/id_rsa" do
 source "keys/gitolite_promet"
 owner "promet"
 group "dev"
 mode 0600
 action :create
end

git "/home/promet/scriptutils" do
   repository "git@git.promethost.com:scriputils"
   action :checkout
   user "promet"
   group "dev"
end
