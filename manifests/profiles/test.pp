##
# Define: openstack_cloud::profiles::test
##
define openstack_cloud::profiles::test {

  include openstack_cloud::profiles::test::base

  file { "/usr/lib/openstack_cloud/tests/${name}":
    source => "puppet:///modules/${module_name}/tests/${name}",
    owner  => 'root',
    group  => 'root',
    mode   => '755',
  }
}
