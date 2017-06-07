define examples::managed_users (
  $password,
) {
  $homedir = $title ? {
    'root'  => '/root',
    default => "/home/$user",
  }

  if $kernel == 'Linux' {
    file { 'bashrc':
      ensure => file,
      owner  => $title,
      group  => $title,
      path   => "${homedir}/.bashrc",
      source => 'puppet:///modules/system/bashrc',
    }
  }
  
  user { $title:
    ensure     => present,
    managehome => true,
    password   => $password,
  }
}
