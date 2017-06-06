class system::hosts {
  
  resources {'host':
    purge => true,
  }
  
  Host {
    ensure => present,
  }
  
  host { $facts['fqdn']:
    ensure       => 'present',
    host_aliases => [$facts['hostname']],
    ip           => $facts['networking']['ip'],
    target       => '/etc/hosts',
  }
  
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
    target => '/etc/hosts',
  }

  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet', 'master'],
    ip           => '172.17.0.1',
    target       => '/etc/hosts',
  }

}
