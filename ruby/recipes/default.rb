#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#





%w{gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison}.each do |pkg|
    package pkg do
     action :install
     options "-y"
    end
end

directory "/home/vagrant/.rbenv" do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

git "/home/vagrant/.rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  revision "master"
  user "vagrant"
  action :sync
end

directory "/home/vagrant/.rbenv/plugins" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  revision "master"
  user "vagrant"
  action :sync                                                                             
end

execute "add bash_profile" do
  user 'vagrant'
  not_if 'which rbenv'
  command <<-EOC
      echo 'export RBENV_ROOT="$HOME/.rbenv"' >> /home/vagrant/.bash_profile
      echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /home/vagrant/.bash_profile
      echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile   
  EOC
end

execute "source bash_profile" do
  user 'vagrant'
  commant <<-EOC
   source ~/.bash_profile
  EOC
end

# execute "install ruby" do
#  command "rbenv install 2.1.0";
# end
#
# execute "set ruby version" do
#  command "rbenv global 2.1.0";
# end

