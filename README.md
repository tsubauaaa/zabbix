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
    <td><tt>['zabbix']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
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
Tsubasa Hirota  tsubasa11@marble.ocn.ne.jp
Released under the same terms as Sensu (the MIT license); see     LICENSE
for details.
