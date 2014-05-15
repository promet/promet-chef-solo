name "newrelic-22nd"
description "New Relic config for 22nd century media"
run_list(
    "recipe[newrelic]",
    "recipe[newrelic::server-monitor]",
    "recipe[newrelic::php-agent]"
)

default_attributes(
  :newrelic => { 
    :server_monitoring => { 
      :license => "da40a45771f5cbec7c50d812ee22199c08526f64"
    },
    :application_monitoring => {
      :license => "da40a45771f5cbec7c50d812ee22199c08526f64",
      :framework => "drupal"
    }
  }
)
