
::Chef::Node.send(:include, Opscode::OpenSSL::Password)

default[:automysqlbackup][:mysql_user]     = "automysqlbackup"
default[:automysqlbackup][:mysql_password] = secure_password
default[:automysqlbackup][:backup_dir] = "/var/backup/mysql"
default[:automysqlbackup][:mail_address] = "root"
