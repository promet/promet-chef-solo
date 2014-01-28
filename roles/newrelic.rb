name "newrelic"
description "New Relic config"
run_list(
    "recipe[newrelic]",
    "recipe[newrelic::server-monitor]"
)

default_attributes(
  :newrelic => { 
    :server_monitoring => { 
      :license => "014ff90b4e2bb88affd4bd72271f488e9cc422f7"
    }
#    :application_monitoring => {
#      :license => "014ff90b4e2bb88affd4bd72271f488e9cc422f7"
#    }
  }
)
