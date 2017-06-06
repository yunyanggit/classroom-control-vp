class review (
  $user = 'review',
){
  include review::motd
  
  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/$user",
  }

  user { '$user':
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { '${homedir}/.bashrc':
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

  service {'puppet':
    ensure => stopped
    enable => false,
    }

  # add the proper resource to ensure that the Puppet agent is not running
  # in the background. How would you discover the service name?

}
