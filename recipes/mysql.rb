#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node['zabbix']['mysql']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  action [ :enable, :start ]
end
