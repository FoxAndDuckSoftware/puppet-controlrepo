# == Class: profile::zabbix::server
#
# Profile that installs and configures zabbix server
class profile::zabbix::server( $zabbixurl = $::servername ) {
    class { '::apache':
        mpm_module => 'prefork'.
    }
    class { '::apache::mod::php': }
    
    class { '::mysql::server': } ->
    class { '::zabbix':
        zabbix_url    => join('http://', $zabbixurl, '/zabbix'),
        database_type => 'mysql',
    }
}
