class review::motd {

  file { 'motd':
    ensure  => file,
    path    => '/etc/motd',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => epp('/review/motd.epp', { user => $review::user }),
  }
  
}
