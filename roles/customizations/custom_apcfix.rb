name "custom_apcfix"
description "apc fix Customizations Role"
run_list(
)

#shm_size letter thing is due to some mmap bug/conflict.
override_attributes(
  "promet_php" => {
    "apc" => {
      "shm_size" => '64'
    }
  }
)
