ssh_known_hosts_entry 'git.promethost.com' do
  key 'git.promethost.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs+ddxWf6IsZFvU02/DFRrEV3LytpcNhsrAWuIV+LaHiiU3ZfZqkTJm5eFRVy3njC+h/1SA2I4cQ3jiL/1tD1RTc8/rIpjIQO4CxgXLkLP1LSUQwN08heY/0i/dqyBfxasEQsvgL3DeIEKlmTFDP0SV5cExDhuRscmjW/Tu4knQCRkY6BtRGA7QhIkzbNJ+qJ0jrmw4XHFOtOFk/ksOgUD1d+QzrFkz09kIZbY++L3xFPD0DOVt8P0P7/7NKoqoD4jZCUhKs++OmijP119KkjgWkv5ZuGp+KGL3wgn99pu0Yl9F2o3+d+SENgQIiYTlExgmyTVEJxgykc18vrJrXTn'
end

cookbook_file "/home/promet/.ssh/id_rsa" do
 source "keys/gitolite_promet"
 owner "promet"
 group "dev"
 mode 0600
 action :create
end

git "/home/promet/scriptutils" do
   repository "git@git.promethost.com:scriptutils.git"
   user "promet"
   group "dev"
   action :sync
end
