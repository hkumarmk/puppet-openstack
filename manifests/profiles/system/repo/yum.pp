#
# Define: openstack_cloud::profiles::system::repo::yum
#
# == Setup yum repos
#
# NOTE: This is not tested. Need to test the whole system on centos/redhat
# system

define openstack_cloud::profiles::system::repo::yum (
    $baseurl,
    $gpgkey,
    $gpgcheck,
    $active_repos = [],
    $comment = $name,
) {
  if member($active_repos,$name) {
    yumrepo { $name:
      descr    => $comment,
      baseurl  => $baseurl,
      gpgkey   => $gpgkey,
      gpgcheck => $gpgcheck,
      enabled  => $enabled,
    }
  }
}
