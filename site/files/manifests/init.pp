class files {
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  file { '/etc/cron.allow': }
  
  file_line { 'allow root cron jobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }
  # Add a rule to cron.deny to deny jobs by default
  file_line { 'deny cron jobs':
    path => '/etc/cron.deny',
    line => '*',
  }

  # What concat resource is needed for this fragment to work?
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }

  # Add a few fragments to be appended to /etc/motd
  concat::fragment { 'message blah':
    target => '/etc/motd',
    order  => '10',
    content => 'This is the body of the MOTD',
  }

}
