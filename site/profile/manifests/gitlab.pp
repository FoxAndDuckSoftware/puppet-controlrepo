class profile::gitlab {
    ## Gitlab prerequisites and itself
    package { [ 'openssh-server', 'postfix', 'git' ]:
        ensure => 'present',
    } -> package { 'gitlab-ce': ensure => present }

    ## Change the gitlab server address url
    file_line { 'gitlab_address':
      ensure  => 'present',
      path    => '/etc/gitlab/gitlab.rb',
      line    => "external_url 'http://10.20.130.39'",
      match   => '^external_url',
      notify  => Exec['gitlab_reconfigure'],
      require => Package['gitlab'],
    }

    ## Gitlab installation items
    exec { 'gitlab_reconfigure':
      command     => 'gitlab-ctl reconfigure',
      path        => [ '/usr/bin' ],
      refreshonly => true,
    }
}
