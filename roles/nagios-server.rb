name "nagios-server"
description "Nagios Monitoring server"
run_list(
  "role[base]",
  "recipe[nagios]",
  "recipe[nagios::server]",
  "recipe[nagios::pagerduty]",
  "recipe[nagios::base_monitoring]"
)

default_attributes(
  "nagios" => { 
    "server_auth_method" => "htauth",
    "server_role" => "nagios-server",
    "notifications_enabled" => "1",
    "sysadmin_email" => "sysadmins@prometsource.com",
    "multi_environment_monitoring" => "true",
    "users_databag_group" => "ops",
    #"pagerduty_key" => "f4cebb41ca874a7090db0ade3ba52703",
    "pagerduty_key" => "7cec8fd0e7c5012e5abc12313d009e57",
    "enable_ssl" => "true",
    "server_name" => "nagios-rsc.promethost.com",
    "additional_contacts" => { "pagerduty" => "true" },
    "default_host" => {
    	"check_interval" => "60",
    	"retry_interval" => "20",
    	"max_check_attempts" => "3"
    	},
    "default_service" => {
    	"check_interval" => "60",
    	"retry_interval" => "20",
    	"max_check_attempts" => "3"
	},
    "ssl_cert_file" => "/etc/nagios3/certificates/nagios-server.crt",
    "ssl_cert_key" => "/etc/nagios3/certificates/nagios-server.key"
#node['nagios']['ssl_cert_file'] = Location of SSL Certificate File. default "/etc/nagios3/certificates/nagios-server.pem"
#node['nagios']['ssl_cert_key'] = Location of SSL Certificate Key. default "/etc/nagios3/certificates/nagios-server.pem"
#node['nagios']['server_name'] - common name to use in a server cert, default "nagios"
#node['nagios']['ssl_req'] - info to
  }
)
