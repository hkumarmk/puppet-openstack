## Class: openstack_cloud::profiles::system
## Purpose: to group all system level configuration together.

class openstack_cloud::profiles::system(
  $security_banner = undef,
  $manage_timezone = true,
  $manage_ntp      = true,
  $manage_repo     = true,
) {

  ##
  # Setup package repos
  ##
  if $manage_repo {
    contain openstack_cloud::profiles::system::repo
  }

  ##
  # Set timezone
  ##
  if $manage_timezone {
    contain ::timezone
    openstack_cloud::profiles::test {'test_timezone.sh':}
  }

  ##
  # Setup ntp servers and ntp clients
  ##
  if $manage_ntp {
    contain ::ntp
    openstack_cloud::profiles::test {'ntp.sh':}
  }

  ##
  ## Added security banner messages
  ##

  $issue = [ '/etc/issue.net','/etc/issue' ]
  if $security_banner {
    file { $issue:
      ensure        => file,
      owner         => root,
      group         => root,
      mode          => 644,
      content       => $security_banner,
    }
  }

}
