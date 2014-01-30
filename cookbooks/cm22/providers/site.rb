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

  conf_d = "#{node.drupal.settings_dir}/#{subdomain}"
  database = @new_resource.database
  drupal_settings conf_d do
    config ({
      'databases' => {
        'default' => {
          'default' => {
            'database' => database['database'],
            'username' => database['username'],
            'password' => database['password'],
            'host'     => 'localhost',
            'driver'   => 'mysql'
          }
        }
      }
    })
    owner machine_user
    group 'www-data'
  end

  composer_project "#{root}/src" do
    action :install
    run_as machine_user
  end

  execute "#{subdomain}-settings-compile" do
    command "vendor/bin/settings_compile #{conf_d} #{root}/cnf/settings.local.php"
    cwd "#{root}/src"
  end

  new_build = "#{root}/builds/#{build_id}"

  directory new_build do
    owner machine_user
    group 'www-data'
  end

  unless ::File.exists? "#{new_build}/index.php"
    execute "22cm_extract_#{subdomain}_#{build_id}" do
      command "tar xzf #{cm22_archive} -C #{new_build} --strip-components=1 && chown -R #{machine_user}:www-data #{new_build}"
    end

    execute "kw-activate-#{subdomain}" do
      user    machine_user
      environment({'HOME' => home})
      cwd     root
      command "drush kw-activate-build builds/#{build_id}"
    end

    directory "#{new_build}/sites/all/vendor" do
      owner machine_user
      group 'www-data'
    end

    execute "install_cm22_site-#{subdomain}" do
      user    machine_user
      environment({'HOME' => home})
      cwd     root
      command "#{root}/src/tools/install.sh && touch #{root}/install.lock"
      creates "#{root}/install.lock"
    end

    execute "composerify-with-durp-durp-durpal-#{subdomain}" do
      user    machine_user
      environment({'HOME' => home})
      cwd     new_build
      command "drush composer-manager install -y"
    end

    execute "update_cm22_site-#{subdomain}" do
      user    machine_user
      environment({'HOME' => home})
      cwd     root
      command "#{root}/src/tools/update.sh #{machine_name}"
      # srsly
      returns [1, 0]
    end

    # there's literally no other way to make this work
    execute "update_cm22_site-#{subdomain}-again" do
      user    machine_user
      environment({'HOME' => home})
      cwd     root
      command "#{root}/src/tools/update.sh #{machine_name}"
    end
  end
end
