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
