class system::hosts {
  
  resources {'host':
    purge => true,
  }
  
  Host {
    ensure => present,
  }
  
  host { 'ddtdigital.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['ddtdigital'],
    ip           => '172.17.0.3',
    target       => '/etc/hosts',
  }
  
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
    target => '/etc/hosts',
  }

  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
    target       => '/etc/hosts',
  }

}
