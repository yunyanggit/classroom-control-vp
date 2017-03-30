class review {
  # this class should accept a parameter rather than having
  # the username hardcoded.
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

  # add the proper resource to ensure that the Puppet agent not running
  # in the background. How would you discover the service name?

}
