#
# Cookbook Name:: zabbix
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'zabbix::iptables'
include_recipe 'zabbix::mysql'
include_recipe 'zabbix::php'

execute "install_zabbix_repo" do
  command <<-"EOH"
    rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
  EOH
  action :run
  not_if { ::File.exists?("/etc/yum.repos.d/zabbix.repo") }
end

node['zabbix']['packages'].each do |pkg|
  package pkg do
    action :install
    version "#{node['zabbix']['version']}.el6"
    options '--enablerepo=zabbix'
  end
end

template '/etc/zabbix/zabbix_agentd.conf' do
  source 'zabbix_agentd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/zabbix/zabbix_server.conf' do
  source 'zabbix_server.conf.erb'
  owner 'root'
  group 'zabbix'
  mode '0640'
end

include_recipe 'zabbix::mysql_setup'

node['zabbix']['services'].each do |svc|
  service svc do
    action [:enable, :start]
  end
end
