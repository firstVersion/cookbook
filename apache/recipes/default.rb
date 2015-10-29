#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
   action :install
end

service "httpd" do
  action [ :enable, :start]
  supports :restart => true
end

directory '/vagrant/html/' do
  owner 'root'
  mode '0777'
  action :create
end

template "httpd.conf" do
  path "/etc/httpd/conf/httpd.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[httpd]'
end



