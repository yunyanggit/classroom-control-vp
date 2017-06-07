define system::managed_user (
  $password = 'update',
) {

  $homedir = $title ? {
    'root'  => '/root',
    default => "/home/$user",
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
  
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
