name "custom_vdb"
description "VDB.org Customizations"
run_list(
)

override_attributes(
  "promet_php" => {
    "apc" => {
      "shm_size" => '128'
    },
    "memory_limit" => "256M",
    "upload_max_filesize" => "1024M",
    "post_max_size" => "1024M",
    "max_execution_time" => "900",
    "max_input_time" => "900"
  }
)
