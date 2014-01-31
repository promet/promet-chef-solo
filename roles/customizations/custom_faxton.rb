name "custom_faxton"
description "Faxton Customizations Role"
run_list(
)

override_attributes(
  "openssh" => {
    "server" => {
      "permit_root_login" => "yes"
    }
  },
  "promet_php" => {
    "apc" => {
      "shm_size" => '128'
    },
    "memory_limit" => "384M",
  }
)
