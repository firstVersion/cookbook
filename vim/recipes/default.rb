#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "vim" do
 action :install
end

template "/home/vagrant/.vimrc" do
  owner "vagrant"
  mode 0777
end

template "/root/.vimrc" do
  owner "root"
  mode 0777
end
