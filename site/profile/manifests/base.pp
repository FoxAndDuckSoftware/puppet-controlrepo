# == Class: profile::base
#
# Base profile for all agents
class profile::base {
    class { '::network::hiera': }
    class { '::ntp': }
}
