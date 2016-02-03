#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "mysql-server" do
  action :install
  version "5.6.46-1.el6.remi"
  options "-y --enablerepo=remi"
end

service "mysqld" do
  action [ :enable, :start ]
end
