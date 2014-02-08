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

  conf_d = "#{node.drupal.settings_dir}/#{subdomain}"
  drupal_settings conf_d do
    config new_resource.config
    owner machine_user
    group node.cm22.httpd_group
  end

  remote_file cm22_archive do
    source archive_url
    action :create_if_missing
  end

  directory root do
    owner     machine_user
    group     node.cm22.httpd_group
    recursive true
  end

  directory "#{root}/archives" do
    owner     machine_user
    group     node.cm22.httpd_group
  end

  git "#{root}/src" do
    user        machine_user
    group       node.cm22.httpd_group
    repository  git_repo
    reference   git_ref
  end

  new_build = "#{root}/builds/#{build_id}"
  unless ::File.exists? "#{new_build}/index.php"

    execute "init-#{subdomain}" do
      user    machine_user
      cwd     root
      command "#{root}/src/tools/init.sh"
      environment({'HOME' => home})
    end

    directory new_build do
      owner machine_user
      group node.cm22.httpd_group
    end

    execute "22cm_extract_#{subdomain}_#{build_id}" do
      command "tar xzf #{cm22_archive} -C #{new_build} --strip-components=1 && chown -R #{machine_user}:#{node.cm22.httpd_group} #{new_build}"
    end

    execute "kw-activate-#{subdomain}" do
      user    machine_user
      environment({'HOME' => home})
      cwd     root
      command "drush kw-activate-build builds/#{build_id}"
    end

    execute "install_cm22_site-#{subdomain}" do
      user    machine_user
      cwd     root
      command "#{root}/src/tools/install.sh && touch #{root}/install.lock"
      creates "#{root}/install.lock"
      environment({
        'HOME' => home,
        'DRUPAL_CONF' => conf_d
      })
    end

    execute "update_cm22_site-#{subdomain}" do
      user    machine_user
      cwd     root
      command "#{root}/src/tools/update.sh #{machine_name}"
      environment({
        'HOME' => home,
        'DRUPAL_CONF' => conf_d
      })
      # srsly
      returns [1, 0]
    end

    # there's literally no other way to make this work
    execute "update_cm22_site-#{subdomain}-again" do
      user    machine_user
      cwd     root
      command "#{root}/src/tools/update.sh #{machine_name}"
      environment({
        'HOME' => home,
        'DRUPAL_CONF' => conf_d
      })
    end
  end
end
