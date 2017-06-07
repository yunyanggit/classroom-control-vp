define system::managed_user (
  $password,
) {
  $homedir = $title ? {
    'root' => '/root',
    default => "/home/$user",
  }
  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }
  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
    ensure => file,
    owner => $title,
    group => $title,
    mode => '0644',
    source => 'puppet:///modules/system/bashrc'
  }
 }
  $password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
      password => $password,
  }
}
