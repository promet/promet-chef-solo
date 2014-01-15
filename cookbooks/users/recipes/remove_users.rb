# removing old users
%w{ brant chad ruoran scott dsblanes keith marius }.each do |del_user|
  user "#{del_user}" do
    action :remove
    ignore_failure true
  end
  group "#{del_user}" do
    action :remove
    ignore_failure true
  end
end
