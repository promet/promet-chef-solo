name 'mongodb'
description "MongoDB Server role"
run_list 'recipe[mongodb::default]'

default_attributes(
  'mongodb' => {
    'install_method' => '10gen'
  }
)
