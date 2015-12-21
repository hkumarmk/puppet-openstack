#
# Define: openstack_cloud::profiles::system::repo::apt
#

define openstack_cloud::profiles::system::repo::apt (
  $location,
  $repos          = 'main',
  $key            = undef,
  $include_src    = false,
  $architecture   = 'amd64',
  $release        = 'trusty',
  $active_repos   = [],
  $pin            = undef,
  $comment        = undef,
) {
  if member($active_repos,$name) {
    ::apt::source { $name:
      location     => $location,
      repos        => $repos,
      include      => { 'src' => $include_src},
      architecture => $architecture,
      release      => $release,
      key          => $key,
      pin          => $pin,
      comment      => $comment,
    }
  }
}
