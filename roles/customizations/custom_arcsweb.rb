name "custom_arcsweb"
description "ARCS Web customizations"
run_list(
)

override_attributes(
  "promet_php" => 
   { "apc" => 
     { "shm_size" => '192M'
     }
   }
)
