#
# Cookbook Name:: TreeTagger
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# english-par-linux-3.2-utf8.bin.gz 
# install-tagger.sh 
# tagger-scripts.tar.gz 
# tree-tagger-linux-3.2.tar.gz

cookbook_file "set english-par-linux" do

  source "english-par-linux-3.2-utf8.bin.gz"
  path   "/home/vagrant/english-par-linux-3.2-utf8.bin.gz"

end

cookbook_file  "set tagger-scripts" do

  source "tagger-scripts.tar.gz"
  path   "/home/vagrant/tagger-scripts.tar.gz"

end

cookbook_file  "set tree-tagger-linux" do

  source "tree-tagger-linux-3.2.tar.gz"
  path   "/home/vagrant/tree-tagger-linux-3.2.tar.gz"

end

cookbook_file  "set installer" do

  source "install-tagger.sh"
  path   "/home/vagrant/install-tagger.sh"

end

execute "install TreeTagger" do
  command <<-EOH
    cd /home/vagrant/
    sh install-tagger.sh
  EOH
end
