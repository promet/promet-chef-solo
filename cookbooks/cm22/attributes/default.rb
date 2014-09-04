default.cm22.webroot = '/var/www/sites'
default.cm22.machine_user = 'www-data'
default.cm22.data_bag
default.cm22.httpd_group = 'www-data'

default.cm22.slave.sites = {
  "publication22cm"             => "publication.prometstaging.com",
  "the_orland_park_prairie"     => "opprairie",
  "the_frankfort_station"       => "frankfortstation",
  "the_homer_horizon"           => "homerhorizon",
  "the_lockport_legend"         => "lockportlegend",
  "the_mokena_messenger"        => "mokenamessenger",
  "the_new_lenox_patriot"       => "newlenoxpatriot",
  "the_tinley_junction"         => "tinleyjunction",
  "the_glenview_lantern"        => "glenviewlantern",
  "the_northbrook_tower"        => "northbrooktower",
  "the_wilmette_beacon"         => "wilmettebeacon",
  "the_winnetka_current"        => "winnetkacurrent",
  "the_highland_park_landmark"  => "hplandmark",
  "malibu_surfside_news"        => "malibusurfsidenews",
  "the_glencoe_anchor"          => "glencoeanchor"
}

default.cm22.slave.process        = []
default.cm22.slave.masters        = {
  local: "http://cm22master.dev",
  development: "http://corporate22cm.prometdev.com",
  staging: "http://corporate22cm.prometstaging.com",
  prod: "https://www.22ndcenturymedia.com",
}
default.cm22.slave.git_repo       = 'git@github.com:promet/CM22Slave'
default.cm22.slave.git_ref        = 'master'
default.cm22.slave.archive.source = 'https://s3-us-west-1.amazonaws.com/promet-22cm/archives/build/slave_production_current.tar.gz'
default.cm22.slave.base_data_bag_item = 'cm22slave-satelite'

default.cm22.master.process         = []
default.cm22.master.git_repo        = 'git@github.com:promet/cm22master'
default.cm22.master.git_ref         = 'master'
default.cm22.master.archive.source  = 'https://s3-us-west-1.amazonaws.com/promet-22cm/archives/build/master_production_current.tar.gz'
default.cm22.master.base_data_bag_item = 'cm22master'
