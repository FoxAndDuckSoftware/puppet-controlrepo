# == Class: role::zabbix::server
#
# Defines a role that installs and configures zabbix server.
class role::zabbix::server {
    include ::profile::zabbix::server
}
