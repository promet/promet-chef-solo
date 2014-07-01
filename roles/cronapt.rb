name "cronapt"
description "cronapt config"
run_list(
    "recipe[cronapt]"
)

default_attributes(
        :cronapt => {
          :mailto => "sysadmins@prometsource.com",
          :enable_upgrade => false,
          :nightly => false
      }
)
