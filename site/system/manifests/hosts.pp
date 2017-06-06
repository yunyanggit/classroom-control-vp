class system::hosts {

  resources {'host': 
    purge => true,
  } 
  
  host {'master.puppetlabs.vm':
    ensure => present,
    host_aliases => ['master'],
    ip  => '172.17.0.1',
   }
   host { 'localhost':
      ip => '127.0.0.1',
    }
## Use your own IP, or the ::ipaddress fact
    host { 'jordan78.puppetlabs.vm':
        ensure => present,
        host_aliases => ['jordan78'],
        ip => $::ipaddress,
    }

   
  # paste the output of `puppet resource host` in this class
  # and then purge unmanaged resources
}
