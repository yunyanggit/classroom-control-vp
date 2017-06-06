class system::hosts {
  resources { 'host':
    purge => true,
  }
  
  Host {
    ensure => present,
  }

  host { $facts['fqdn']:
    host_aliases => [$facts['hostname']],
    ip           => $facts['networking']['ip'],
  }
  
  host { 'localhost':
    ip     => '127.0.0.1',
  }
  
  host { 'master.puppetlabs.vm':
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
  }
}
