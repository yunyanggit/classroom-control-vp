class system::classroom {
  @@host { $::fqdn:
    ensure       => 'present',
    host_aliases => [$::hostname],
    ip           => $::ipaddress,
    tag          => 'classroom',
  }

  Host <<| tag == 'classroom' |>>
}
