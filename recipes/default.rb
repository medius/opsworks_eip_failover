package 'awscli' do
  action :upgrade
end

service "monit" do
  supports :status => false, :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/failtome.sh' do
  source 'failtome.sh.erb'
  owner 'root'
  group 'root'
  mode 0755
end

template "#{node[:monit][:conf_dir]}/haproxywatch.monitrc" do
  source 'haproxywatch.monitrc.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, "service[monit]", :immediately
end
