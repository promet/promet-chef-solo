Overview
========

Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live. We strongly recommend storing this repository in a version control system such as Git and treat it like source code.

While we prefer Git, and make this repository available via GitHub, you are welcome to download a tar or zip archive and use your favorite version control system to manage the code.

Repository Directories
======================

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

* `certificates/` - SSL certificates generated by `rake ssl_cert` live here.
* `config/` - Contains the Rake configuration file, `rake.rb`.
* `cookbooks/` - Cookbooks you download or create.
* `data_bags/` - Store data bags and items in .json in the repository.
* `roles/` - Store roles in .rb or .json in the repository.

Rake Tasks
==========

The repository contains a `Rakefile` that includes tasks that are installed with the Chef libraries. To view the tasks available with in the repository with a brief description, run `rake -T`.

The default task (`default`) is run when executing `rake` with no arguments. It will call the task `test_cookbooks`.

The following tasks are not directly replaced by knife sub-commands.

* `bundle_cookbook[cookbook]` - Creates cookbook tarballs in the `pkgs/` dir.
* `install` - Calls `update`, `roles` and `upload_cookbooks` Rake tasks.
* `ssl_cert` - Create self-signed SSL certificates in `certificates/` dir.
* `update` - Update the repository from source control server, understands git and svn.

The following tasks duplicate functionality from knife and may be removed in a future version of Chef.

* `metadata` - replaced by `knife cookbook metadata -a`.
* `new_cookbook` - replaced by `knife cookbook create`.
* `role[role_name]` - replaced by `knife role from file`.
* `roles` - iterates over the roles and uploads with `knife role from file`.
* `test_cookbooks` - replaced by `knife cookbook test -a`.
* `test_cookbook[cookbook]` - replaced by `knife cookbook test COOKBOOK`.
* `upload_cookbooks` - replaced by `knife cookbook upload -a`.
* `upload_cookbook[cookbook]` - replaced by `knife cookbook upload COOKBOOK`.

Configuration
=============

The repository uses two configuration files.

* config/rake.rb
* .chef/knife.rb

The first, `config/rake.rb` configures the Rakefile in two sections.

* Constants used in the `ssl_cert` task for creating the certificates.
* Constants that set the directory locations used in various tasks.

If you use the `ssl_cert` task, change the values in the `config/rake.rb` file appropriately. These values were also used in the `new_cookbook` task, but that task is replaced by the `knife cookbook create` command which can be configured below.

The second config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Opscode Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

http://help.opscode.com/faqs/chefbasics/knife

Working With Servers
====================

### Creating Rackspace Servers

Creating rackspace servers requires the knife gem extention:

````
gem install knife-rackspace
````

Addtionally, you will need the API credentials added to your knife.rb file:

````
# Promet Rackspace:
knife[:rackpace_auth_url] = "https://identity.api.rackspacecloud.com/v2.0"
knife[:rackspace_version] = "v2"
knife[:rackspace_api_key] = "somealphanumericstring"
knife[:rackspace_api_username] = "someaccountname"
knife[:rackspace_compute_url] = "https://ord.servers.api.rackspacecloud.com/v2"
````

##### Debian 6
````
knife rackspace server create -r 'role[drupal]' -E dev -I 92a28e50-181d-4fc7-a071-567d26fc95f6 -f 4 -N chef11-promet-rsc.promethost.com -S chef11-promet-rsc.promethost.com
````

##### Debian 7
````
knife rackspace server create -r 'role[drupal]' -E dev -I f9a2ad96-355a-4696-a8f9-58d210050e59 -f 4 -N chef11-promet-rsc.promethost.com -S chef11-promet-rsc.promethost.com
````

##### Ubuntu 12

````
knife rackspace server create -r 'role[drupal]' -E dev -I e4dbdba7-b2a4-4ee5-8e8f-4595b6d694ce -f 4 -N chef11-promet-rsc.promethost.com -S chef11-promet-rsc.promethost.com
````


##### Ubuntu 13
````
knife rackspace server create -r 'role[drupal]' -E dev -I ba67f3fe-eb40-4428-b5a4-a7e1b2615cf7 -f 4 -N chef11-promet-rsc.promethost.com -S chef11-promet-rsc.promethost.com
````

### Creating AWS Instances

The implementation of EC2 instances takes a bit different config.  Contact the sysadmins to get your hands on the necessary keys and credentials for your knife.rb file.

````
gem install knife-ec2
````

````
# Promet AWS:
knife[:aws_access_key_id] = "youraccesskeyid"
knife[:aws_secret_access_key] = "youralphanumerickeystring"
````

##### Debian 6

We have created a custom AMI on our promet account to use.  The AMI shown in this example will not work outside of Promet! 

````
knife ec2 server create -r 'role[drupal]' -E _default -I ami-5236ab62 -f m1.small -x root -i .chef/ops-uswest2.pem -G Ops -S ops-uswest2 -N chef11-promet-rsc.promethost.com -Z us-west-2a --region us-west-2
````


Next Steps
==========

Read the README file in each of the subdirectories for more information about what goes in those directories.
