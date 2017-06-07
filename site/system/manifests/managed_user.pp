define system::managed_user (
  $password,
) {
  $homedir = $title ? {
    'root' => '/root',
    default => "/home/${user}",
  }

  File {
    owner => $title,
    group => $title,
    mode  => '0644',
  }
 
  user { $title:
    ensure     => present,
    password   => $password,
    managehome => true,
  }
  
  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      source => 'puppet:///modules/system/bashrc',
    }
  }
}
