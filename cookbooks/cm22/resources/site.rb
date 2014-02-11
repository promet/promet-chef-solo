actions :update
default_action :update

attribute :subdomain,     :kind_of => String,             :name_attribute => true
attribute :machine_name,  :kind_of => [String, NilClass], :default => nil
attribute :machine_user,  :kind_of => String
attribute :environment,   :kind_of => String, :default => 'staging'
attribute :command,       :kind_of => String
attribute :root,          :kind_of => String
attribute :config,        :kind_of => Hash
attribute :archive_url,   :kind_of => String
attribute :git_repo,      :kind_of => [String, NilClass], :default => nil
attribute :git_ref,       :kind_of => [String, NilClass], :default => nil
