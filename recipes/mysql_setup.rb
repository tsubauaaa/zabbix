#
# Cookbook Name:: mysql_setup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "mysql_secure_install" do
  command <<-"EOH"
    mysqladmin drop test -f
    mysql -e "delete from user where user = '';" -D mysql
    mysql -e "delete from user where user = 'root' and host = \'#{node[:hostname]}\';" -D mysql
    mysql -e "SET PASSWORD FOR 'root'@'::1' = PASSWORD('#{node['zabbix']['mysql']['root_password']}');" -D mysql
    mysql -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('#{node['zabbix']['mysql']['root_password']}');" -D mysql
    mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('#{node['zabbix']['mysql']['root_password']}');" -D mysql
    mysqladmin flush-privileges -p"#{node['zabbix']['mysql']['root_password']}"
  EOH
  only_if "mysql -u root -e 'show databases;'"
end

execute "create_db" do
  command <<-"EOH"
    mysql -u root -p"#{node['zabbix']['mysql']['root_password']}" -e "create database zabbix character set utf8;"
  EOH
  action :run
  not_if "mysql -u root -p#{node['zabbix']['mysql']['root_password']} -D #{node['zabbix']['mysql']['db_name']}"
end

execute "create_user" do
  command <<-"EOH"
    mysql -u root -p"#{node['zabbix']['mysql']['root_password']}" -e "grant all privileges on #{node['zabbix']['mysql']['user_name']}.* to #{node['zabbix']['mysql']['db_name']}@localhost identified by '#{node['zabbix']['mysql']['user_password']}';"
    mysql -u root -p"#{node['zabbix']['mysql']['root_password']}" -e "FLUSH PRIVILEGES;"
  EOH
  action :run
  only_if "mysql -u root -p#{node['zabbix']['mysql']['root_password']} -D #{node['zabbix']['mysql']['db_name']}"
end

execute "create_schema_images_data" do
  command <<-"EOH"
    mysql -uroot -p"#{node['zabbix']['mysql']['root_password']}" "#{node['zabbix']['mysql']['db_name']}" < /usr/share/doc/zabbix-server-mysql-2.4.5/create/schema.sql
    mysql -uroot -p"#{node['zabbix']['mysql']['root_password']}" "#{node['zabbix']['mysql']['db_name']}" < /usr/share/doc/zabbix-server-mysql-2.4.5/create/images.sql
    mysql -uroot -p"#{node['zabbix']['mysql']['root_password']}" "#{node['zabbix']['mysql']['db_name']}" < /usr/share/doc/zabbix-server-mysql-2.4.5/create/data.sql

  EOH
  action :run
  only_if "mysql -u root -p#{node['zabbix']['mysql']['root_password']} -D #{node['zabbix']['mysql']['db_name']}"
end
