zabbix Cookbook
===============
zabbix-server,agent install

Requirements
------------
platforms:amazon,centos6.5~

Attributes
----------
TODO: List your cookbook attributes here.

#### zabbix::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['zabbix']['packages']</tt></td>
    <td>Array</td>
    <td>zabbix packages</td>
    <td><tt>%w{zabbix-server-mysql zabbix-web-mysql zabbix-web-japanese zabbix-agent}</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['services']</tt></td>
    <td>Array</td>
    <td>zabbix services</td>
    <td><tt>%w{zabbix-server zabbix-agent httpd}</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['db_password']</tt></td>
    <td>String</td>
    <td>password zabbix DB in mysql</td>
    <td><tt>zabbix</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['db_name']</tt></td>
    <td>String</td>
    <td>mysql DB for zabbix</td>
    <td><tt>zabbix</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['version']</tt></td>
    <td>String</td>
    <td>version for zabbix</td>
    <td><tt>zabbix</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['agent']['server']</tt></td>
    <td>String</td>
    <td>zabbix server</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['agent']['hostnameitem']</tt></td>
    <td>String</td>
    <td>HostnameItem in agent config</td>
    <td><tt>system.hostname</tt></td>
  </tr>
  <tr>
    <td><tt>['zabbix']['agent']['HostMetadata']</tt></td>
    <td>String</td>
    <td>HostMetadata in agent config</td>
    <td><tt>tsubauaaa</tt></td>
  </tr>
</table>

Usage
-----
#### zabbix::default
Just include `zabbix::default` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[zabbix::default]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Distributed under the [MIT License][mit].
