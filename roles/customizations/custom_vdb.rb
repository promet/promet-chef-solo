name "custom_vdb"
description "VDB customizations"
run_list(
)

override_attributes(
  :promet_php => {
    :upload_max_filesize => "1024M",
    :apc => {
      :shm_size => "128M"
	}
   }
)
