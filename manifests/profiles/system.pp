## Class: openstack_cloud::profiles::system
## Purpose: to group all system level configuration together.

class openstack_cloud::profiles::system(
  $security_banner  = undef,
) {

  ##
  # Set timezone
  ##

  contain ::timezone

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
