action :update do
  machine_user  = @new_resource.machine_user
  subdomain     = @new_resource.subdomain
  machine_name  = @new_resource.machine_name
  root          = @new_resource.root
  home          = "/home/#{machine_user}"
  git_repo      = @new_resource.git_repo
  git_ref       = @new_resource.git_ref
  archive_url   = @new_resource.archive_url

  archive_name        = ::File.basename ::URI.parse(archive_url).path
  build_id            = archive_name.split('.').first.split('_').last
  cm22_archive        = "#{Chef::Config[:file_cache_path]}/#{archive_name}"

  remote_file cm22_archive do
    source node.cm22.slave.archive.source
    action :create_if_missing
  end

  directory root do
    owner     machine_user
    group     'www-data'
    recursive true
  end

  directory "#{root}/archives" do
    owner     machine_user
    group     'www-data'
  end

  git "#{root}/src" do
    user        machine_user
    group       'www-data'
    repository  git_repo
    reference   git_ref
  end

  execute "kraftwagen-setup-#{subdomain}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command 'drush kw-s'
  end

  new_build = "#{root}/builds/#{build_id}"

  directory new_build do
    owner machine_user
    group 'www-data'
  end

  execute "22cm_extract_#{subdomain}_#{build_id}" do
    command "tar xzf #{cm22_archive} -C #{new_build} --strip-components=1"
    not_if do ::File.exists? "#{new_build}/index.php" end
  end

  execute "kw-activate-#{subdomain}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "drush kw-activate-build builds/#{build_id}"
  end

  execute "install_cm22slave_site-#{subdomain}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "#{root}/src/tools/install.sh && touch #{root}/install.lock"
    creates "#{root}/install.lock"
  end

  execute "update_cm22slave_site-#{subdomain}" do
    user    machine_user
    environment({'HOME' => home})
    cwd     root
    command "#{root}/src/tools/update.sh #{machine_name}"
  end
end
