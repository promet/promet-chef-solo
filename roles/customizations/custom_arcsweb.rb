name "custom_arcsweb"
description "ARCS Web Customizations"
run_list(
)

override_attributes(
  "promet_php" => {
    "apc" => {
      "shm_size" => '256M'
    },
    "memory_limit" => "256M",
    "upload_max_filesize" => "50M",
    "post_max_size" => "50M",
    "max_execution_time" => "600",
    "max_input_time" => "600"
  }
)