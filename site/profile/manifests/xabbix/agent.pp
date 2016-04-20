# == Class: profile::xabbix::agent
#
class profile::xabbix::agent($server) {
    class { '::xabbix::agent':
        server => $server
    }
}
