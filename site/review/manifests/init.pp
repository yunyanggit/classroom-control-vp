class review (
 $user = 'review',
) {

 include review::motd
 
 $homedir = $user ? {
   'root'  => '/root',
   default => "/home/$user",
 }

  user { 'bob':
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { '/home/bob/.bashrc':
    ensure => file,
    owner  => 'bob',
    group  => 'bob',
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

  # add the proper resource to ensure that the Puppet agent is not running
  # in the background. How would you discover the service name?
  service { 'puppet':
   ensure => stopped,
   enable => false,
  }
}
