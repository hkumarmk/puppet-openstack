#
# Class openstack_cloud::profiles::system::repo
#
#
class openstack_cloud::profiles::system::repo (
  $all_repos         = {},
  $active_repos      = [],
  $enable_puppetlabs = true,
){
  case $::osfamily {
    'Debian': {

      contain ::apt

      Apt::Source<||> -> Package<||>

      create_resources(openstack_cloud::profiles::system::repo::apt, $all_repos, { active_repos => $active_repos })
    }
    'RedHat': {

      Yumrepo<||> -> Package<||>

      create_resources(openstack_cloud::profiles::system::repo::yum, $all_repos, { active_repos => $active_repos })
    }
    default: {
      fail("OS family ${::osfamily} not supported")
    }
  }

  # Setup puppet package repo source
  if $enable_puppetlabs {
    include puppet::repo::puppetlabs
  }
}
