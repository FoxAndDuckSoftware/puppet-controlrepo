# == Class: role::zabbix::agent
#
# Defines a role that provides the node with the zabbix agent.
class role::zabbix::agent {
    include ::profile::zabbix::agent
}
