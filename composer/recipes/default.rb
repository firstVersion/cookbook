#
# Cookbook Name:: composer
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

bash "install comporser" do
  cwd '/usr/local/bin/'
  code <<-EOC
    curl -sS https://getcomposer.org/installer | php
  EOC
  creates "/usr/local/bin/composer"
end

ruby_block "Rename composer.phar" do
  not_if { File.exists?("/usr/local/bin/composer")}
  block do
    ::File.rename("/usr/local/bin/composer.phar","/usr/local/bin/composer")
  end
end
