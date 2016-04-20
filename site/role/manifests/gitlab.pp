# == Class: role::gitlab
#
# Defines a role that installs and configures gitlab-ce
class role::gitlab {
    include ::profile::gitlab
}
