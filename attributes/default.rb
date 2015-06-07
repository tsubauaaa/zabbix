default['zabbix']['packages'] = %w{zabbix-server-mysql zabbix-web-mysql zabbix-web-japanese zabbix-agent}
default['zabbix']['services'] = %w{zabbix-server zabbix-agent httpd}
default['zabbix']['db_password'] = 'zabbix'
default['zabbix']['db_name'] = 'zabbix'
default['zabbix']['version'] = '2.4.5-1'
default['zabbix']['agent']['server'] = 'localhost'
default['zabbix']['agent']['hostnameitem'] = 'system.hostname'
default['zabbix']['agent']['hostmetadata'] = 'tsubauaaa'
