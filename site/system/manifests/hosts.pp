class system::hosts {
  resources { 'host':
    purge => true,
  }
  
  Host {
    ensure => present,
  }

  host { 'josephoaks.puppetlabs.vm':
    host_aliases => ['josephoaks'],
    ip           => '172.17.0.2',
  }
  
  host { 'localhost':
    ip     => '127.0.0.1',
  }
  
  host { 'master.puppetlabs.vm':
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
  }
}
