name             'test_cm22'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures test_cm22'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'database'
depends 'chef-solo-search'
depends 'users'
depends 'ssh_known_hosts'
depends 'sudo'
