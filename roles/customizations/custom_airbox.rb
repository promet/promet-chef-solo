name "custom_airbox"
description "Airbox Customizations Role"
run_list(
)

override_attributes(
{
  :php => {
    :install_method => 'source',
    :version => '5.4.20',
    :checksum => '33da252e919715492769cdddb9c999080cfd84a0b432f10f197bc950cb02da09',
    :memory_limit => "256M",
    :upload_max_filesize => "50M",
    :apc => { "shm_size" => "96M" }
  }
}
)
