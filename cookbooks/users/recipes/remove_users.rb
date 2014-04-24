# removing old users
%w{ maksim jonathan brant chad ruoran scott dsblanes keith marius geoff jake }.each do |del_user|
  user "#{del_user}" do
    action :remove
    ignore_failure true
  end
  group "#{del_user}" do
    action :remove
    ignore_failure true
  end
end
