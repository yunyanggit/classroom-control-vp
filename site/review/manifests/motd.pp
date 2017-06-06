class review::motd {
  file { '/etc/motd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => epp('review/motd.epp'),
  }
}
class review::motd {
 file { 'motd':
   ensure  => file,
   path    => '/etc/motd',
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   #content => epp('review/motd.epp', { user => $review::user }),
   content => epp('review/motd.epp'),
  }
}
