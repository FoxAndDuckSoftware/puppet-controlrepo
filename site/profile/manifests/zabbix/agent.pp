# == Class: profile::zabbix::agent
#
class profile::zabbix::agent($server) {
    class { '::zabbix::agent':
        server => $server
    }
}
