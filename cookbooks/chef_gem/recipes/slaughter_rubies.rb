include_recipe "chef_gem"

%w{compass rb-fchange oily_png sass-globbing compass-validator compass-normalize compass-rgbapng susy}.each do |gem|
  chef_gem gem do
    action :install
    options "--no-ri --no-rdoc"
  end
end

%w{singularitygs toolkit css_parser guard guard-compass guard-shell guard-livereload yajl-ruby}.each do |gem|
  chef_gem gem do
    action :install
    options "--no-ri --no-rdoc"
  end
end
