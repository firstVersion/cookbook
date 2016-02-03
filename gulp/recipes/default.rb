#
# Cookbook Name:: gulp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute#

bash "install gulp" do
  code <<-EOC
    npm install gulp -g
  EOC
end
