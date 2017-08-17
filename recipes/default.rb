#
# Cookbook Name:: node_app
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

apt_update



package 'nginx'

package 'nodejs'
package 'npm'

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



