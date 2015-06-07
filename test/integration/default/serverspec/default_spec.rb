require 'serverspec'

set :backend, :exec

%w{ zabbix-server zabbix-agent httpd php }.each do |zabbix|
  describe package( zabbix ) do
    it { should be_installed }
  end
end

%w{ mysql-server mysql }.each do |mysql|
  describe package( mysql ) do
    it { should be_installed }
  end
end

%w{ zabbix-server zabbix-agent httpd }.each do |zabbix|
  describe service( zabbix ) do
    it { should be_enabled }
    it { should be_running }
  end
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe file("/etc/php.ini") do
  it { should be_file }
  its(:content) { should match /Asia\/Tokyo/ }
  its(:content) { should match /\"UTF-8\"/ }
end

describe file("/etc/my.cnf") do
  it { should be_file }
  its(:content) { should match /utf8/ }
end

describe port(80) do
  it { should be_listening }
end

describe port(3306) do
  it { should be_listening }
end

describe port(10050) do
  it { should be_listening }
end

describe port(10051) do
  it { should be_listening }
end
