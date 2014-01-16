name "cronapt"
description "cronapt config"
run_list(
    "recipe[cronapt-cookbook]"
)

default_attributes(
        :cronapt => {
          :mailto => "sysadmin@prometsource.com",
          :enable_upgrade => 'true',
          :nightly => 'true'
      }
)
