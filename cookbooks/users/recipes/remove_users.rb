# removing old users
%w{ keith marius }.each do |del_user|
  user "#{del_user}" do
    action :remove
    ignore_failure true
  end
end
