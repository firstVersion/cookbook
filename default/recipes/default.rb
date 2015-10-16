#
# Cookbook Name:: default
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "unzip" do
  action :install
  options "-y"
end

package "mlocate" do
  action :install
  options "-y"
end
