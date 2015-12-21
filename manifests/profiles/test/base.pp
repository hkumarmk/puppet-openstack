#
# Base class that sets up tests
#
class openstack_cloud::profiles::test::base {

  package { 'nagios-plugins':
    ensure => present,
  }

  file { ['/usr/lib/openstack_cloud', '/usr/lib/openstack_cloud/tests']:
    ensure => directory,
  }

}
