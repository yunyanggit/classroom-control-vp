class system::hosts {
  # paste the output of `puppet resource host` in this class
  # and then purge unmanaged resources
  resources {'host':
    purge => true
  }
  # host { 'jtmackoy.puppetlabs.vm':
  #   ensure       => 'present',
  #   host_aliases => ['jtmackoy'],
  #   ip           => '172.17.0.10',
  #   target       => '/etc/hosts',
  # }
  Host {
    target => '/etc/hosts'
  }
  host { 'jtmackoy.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['jtmackoy'],
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
  }
}
