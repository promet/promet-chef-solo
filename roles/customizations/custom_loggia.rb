name "custom_loggia"
description "Loggia Customizations Role"
run_list(
)

#<%= node[:php][:memory_limit] %>
#[:php][:apc:][:shm_size]  = "128M"
override_attributes(
  "promet_php" => {
    "apc" => {
      "shm_size" => '128'
    },
    "memory_limit" => "384M",
  }
)
