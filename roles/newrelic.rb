name "newrelic"
description "NewRelic Monitoring Service Role"
run_list(
    "recipe[newrelic]"
)

default_attributes(
  :newrelic => { :license_key => "014ff90b4e2bb88affd4bd72271f488e9cc422f7" }
)
