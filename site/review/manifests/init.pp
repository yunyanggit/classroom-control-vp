class review
  (
    # Variable from exercise 2.2
    $user = 'review'
  ){
  # this class should accept a parameter rather than having
  # the username hardcoded.

  #  Uncomment and use this variable where appropriate
  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/$user",
  }

  # Code from exercise 2.2
  include review::motd

  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

  service { 'puppet':
    ensure => 'stopped',
    enable => 'false',
  }

  # Existing code from example
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

}
