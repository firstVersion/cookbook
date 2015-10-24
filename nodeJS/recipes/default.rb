#
# Cookbook Name:: nodeJS
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


package "epel-release" do
  action :install
end

package "npm" do
  action :install
  options "--enablerepo=epel"
end

bash "install n" do
  not_is { File.exists?("/usr/bin/n") }
  code <<-EOC
    npm install n -g
  EOC
end

bash "install node latest version" do
  code <<-EOC
    n latest
  EOC
end


