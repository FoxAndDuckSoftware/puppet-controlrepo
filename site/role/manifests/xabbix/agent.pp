# == Class: role::xabbix::agent
#
# Defines a role that provides the node with the xabbix agent.
class role::xabbix::agent {
    include ::profile::xabbix::agent
}
