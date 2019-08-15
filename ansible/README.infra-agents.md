# Configuring zabbix and filebeat agents for your Openstack system

- [Howto](#Howto)
- [Information](#information)


##Howto

1. Make sure openstack secrets and jukebox are setup properly as described in [README.md](README.md).
2. Set your zabbix preshared key in '~/secrets/zabbix_secrets.yml' <br>
`zabbixpsk: <key>`
3. Configure the confg/hosts, setting the name, ansible_ssh_host, ansible_ssh_user and ansible_ssh_private_key_file
```
[VM]
a-jupyter      ansible_ssh_host=1.1.1.1   ansible_ssh_user=uSeR ansible_ssh_private_key_file=~/.ssh/A_KEY
```
4. Run `ansible-playbook -i config/hosts deploy-infra-agnets.yml` 

After completion you can check the services are running in you VM with <br>
`services --status-all`

##Information
####Zabbix
Zabbix works by installing zabbix agents on all the hosts we want to be monitored, then a zabbix server will communicate with all the hosts we have configured and monitor them.

####Filebeat
Filebeat acts as "log monitor/shipper" which can route logs from locations you configure into something like elastic search where it can be indexed and queried.
