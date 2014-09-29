promet_apache2 cookbook
-----------------------

This cookbook is to provide extensibility that we may want when using the contrib Apache2 Cookbook from Opscode.

Requirements
------------
* [vagrant](http://downloads.vagrantup.com/) >= 1.2.0
* [berkshelf](http://berkshelf.com/) >= 2.0.0
* [vagrant-berkshelf plugin](https://github.com/RiotGames/vagrant-berkshelf) >= 1.3.3

Usage
-----

In your Vagrantfile, leverage these contrib attributes:

````
        :apache => {
          :ext_status => "true",
          :listen_ports => ["80", "443"],
          :traceenable => "Off",
          :serversignature => "Off",
          :default_site_enabled => "false",
          :servertokens => "Prod",
          :timeout => 15,
          :prefork => {
            :startservers => 10,
            :minspareservers => 10,
            :maxspareservers => 24,
            :maxclients => 100,
            :maxrequestsperchild => 10000
            }
````

Attributes
----------

No additional attributes yet.

Recipes
-------

No additional recipes yet.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: None.  Do as you wish.
Authors: gregpalmier
