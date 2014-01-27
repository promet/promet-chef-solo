name "custom_nmh"
description "NMH Customizations Role"
run_list(
)

#<%= node[:php][:memory_limit] %>
#[:php][:apc:][:shm_size]  = "128M"
override_attributes(
  "promet_php" => {
    "apc" => {
      "apc_enabled" => '0'
    }
  }
)
