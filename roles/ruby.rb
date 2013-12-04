name "ruby"
description "Promet Ruby Role"
run_list(
    "recipe[ruby_build]",
    "recipe[rbenv::system]"
)

default_attributes(
  'rbenv' => {
    'global' => '1.9.3-p327',
    'rubies' => ['1.9.3-p327'],
    'gems' => {
      '1.9.3-p327' => [{'name' => 'bundler'}]
    }
  }
)
