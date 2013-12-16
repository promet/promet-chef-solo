name "apache2"
description "Apache2 role"
run_list(
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[apache2::mod_ssl]",
    "recipe[apache2::mod_rewrite]",
    "recipe[apache2::mod_expires]",
    "recipe[apache2::mod_deflate]",
    "recipe[apache2::mod_status]",
    "recipe[apache2::mod_headers]"
)

default_attributes(
  :apache => {
    :ext_status => "true",
    :listen_ports => ["80", "443"],
    :traceenable => "Off",
    :serversignature => "Off",
    :servertokens => "Prod",
    :timeout => 15,
    :prefork => {
      :startservers => 10,
      :minspareservers => 10,
      :maxspareservers => 24,
      :maxclients => 100,
      :maxrequestsperchild => 10000
    }
  }
)
