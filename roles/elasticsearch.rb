name "elasticsearch"
description "elasticsearch config"
run_list(
    "recipe[elasticsearch]"
)

default_attributes(
   :elasticsearch => { 
     :cluster => { 
       :name => "elasticsearch_test_chef"
     }
   }
)
