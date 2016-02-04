#
# Cookbook Name:: nodeJS
# Recipe:: default
#
# Copyright 2015, Version1 
#
# All rights reserved - Do Not Redistribute

package "epel-release" do
  action :install
end

bash 'add repo' do
  code <<-EOC
  curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
  EOC
end

package "nodejs" do
  action :install
end

package "npm" do
  action :install
  options "--enablerepo=epel"
end

bash "install n" do
  not_if { File.exists?("/usr/bin/n") }
  code <<-EOC
    npm install n -g
  EOC
end
