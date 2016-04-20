# == Class: profile::gitlab
#
# Defines what is required for the gitlab instance.
class profile::gitlab {
    # Gitlab prerequisites and itself
    package { [ 'curl', 'policycoreutils', 'openssh-server', 'openssh-clients',
                'postfix', 'git' ]:
                ensure => 'present',
    } -> package { 'gitlab-ce': ensure => present, }

    # Change the gitlab server address url
    file_line { 'gitlab_address':
        ensure  => 'present',
        path    => '/etc/gitlab/gitlab.rb',
        line    => "external_url 'http://10.20.130.39'",
        match   => '^external_url',
        notify  => Exec['gitlab_reconfigure'],
        require => Package['gitlab-ce'],
    }

    # Gitlab reconfigure command
    exec { 'gitlab_reconfigure':
        command     => 'gitlab-ctl reconfigure',
        path        => [ '/usr/bin' ],
        refreshonly => true,
    }

    # Postfix service
    service { 'postfix':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
    }

    # Postfix ipv4 fix
    file_line { 'postfix_ipv4only':
        ensure => present,
        line   => 'inet_protocols = ipv4',
        match  => '^inet_protocols',
        notify => Service['postfix'],
    }
}
