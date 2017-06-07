define system::managed_user (
  $home     = undef,
  $password = '$1$VSUyFGs6$RGUYKnirie7v2AS9z06xd1',
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
 
  $user { $title:
    ensure     => present,
    password   => $password,
    managehome => true,
  }
  
  if $kernel == 'Linux' {
    file { 'bashrc':
      ensure => file,
      path   => "${homedir}/.bashrc",
      source => 'puppet:///modules/system/bashrc',
    }
  }
}
