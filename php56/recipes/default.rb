#
# Cookbook Name:: php56
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php" do
  action :install
  options "-y"
end

package "php-*" do
  action :remove
  options "-y"
end

%w{php php-common php-cli php-pdo php-mysql php-devel php-gd php-mbstring php-intl}.each do |pkg|
  package pkg do
    action :install
    options "-y --enablerepo=remi-php56"
  end
end

