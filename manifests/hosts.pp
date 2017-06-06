class system::hosts {
  resources {'host':
  purge => true,
}
  host { $facts['fqdn]:
    ensure       => 'present',
    host_aliases => $facts['hostname'],
    ip           => $facts['networking']['ip'],
  }
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
    target       => '/etc/hosts',
  }
}
