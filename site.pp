## Main site.pp

Exec {
  path => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/','/usr/local/bin/','/usr/local/sbin/' ],
}

File {
  owner => 'root',
  group => 'root',
}

node default {
  include role::base
}
