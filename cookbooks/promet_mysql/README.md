promet_mysql-cookbook
---------------------

This aims to leverage the Chef contrib MySQL cookbook to easily accommodate updates and provide organizational customizations to devs.

Requirements
------------

* [vagrant](http://downloads.vagrantup.com/) >= 1.2.0
* [berkshelf](http://berkshelf.com/) >= 2.0.0
* [vagrant-berkshelf plugin](https://github.com/RiotGames/vagrant-berkshelf) >= 1.3.3

Usage
-----

Add this to other projects to leverage our additions along contrib in your Berksfile.

````
cookbook "promet_mysql-cookbook", "~> 0.1.0", git: "https://github.com/promet/promet_mysql-cookbook.git"
````

Then utilize the out-of-the-box tunables, as well as additions in your Vagrantfile.

````
    chef.json = {
        :mysql => {
          :server_root_password => 'rootpass',
          :server_debian_password => 'debpass',
          :server_repl_password => 'replpass',
          :remove_anonymous_users => "true",
          :tunable => {
            :key_buffer => "256M",
            :max_allowed_packet => '512M',
            :table_cache => "4096",
            :connect_timeout => "30",
            :query_cache_size => "128M",
            :max_heap_table_size => "128M"
          }
        }
     }
````

````
        "recipe[mysql::server]",
        "recipe[promet_mysql-cookbook]",
        "recipe[promet_mysql-cookbook::mytop]",
        "recipe[promet_mysql-cookbook::my_root]"
````


Attributes
----------

None yet.  Just what comes with the contrib MySQL Cookbook (here)[https://github.com/opscode-cookbooks/mysql]

Recipes
-------

* my_root - Creates quick template to allow passwordless login.
* mytop - Installs the mytop package.

Author
------

Author:: gregpalmier (<gregpalmier@gmail.com>)
