#
# Cookbook Name:: node_app
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

apt_update 'update'

package 'nginx'


remote_file '/tmp/nodesource_setup.sh' do
  source 'https://deb.nodesource.com/setup_6.x'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'node sources' do
	command '/tmp/nodesource_setup.sh'
end

apt_update 'update'

package 'nodejs'

service 'nginx' do
	supports :restart => true, :reload => true, :start => true
	action [:enable, :start]
end


template '/etc/nginx/sites-available/default' do 

	source 'default.erb'
	mode '0755'
	owner 'root'
	group 'root'
	notifies :restart, "service[nginx]"

end

execute 'install_pm2' do
  command 'sudo npm install -g pm2'
end



