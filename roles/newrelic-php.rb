name "newrelic-php"
description "New Relic PHP app monitoring enabler"
run_list(
    "role[newrelic]",
    "recipe[newrelic::php-agent]"
)

default_attributes(
  :newrelic => { 
    :application_monitoring => {
      :license => "014ff90b4e2bb88affd4bd72271f488e9cc422f7",
      :framework => "drupal"
    }
  }
)
