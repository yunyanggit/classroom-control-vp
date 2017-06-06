class system::hosts {
   resources {'host':    purge => true, 
   } 
   
   host { 'master.puppetlabs.vm':   
     ensure => present,   
     host_aliases => ['master'],   
     ip => '192.168.X.X',  
   } 
   
   host { 'localhost':   
     ensure => present,   
     host_aliases => [    
       'localhost.localdomain',    
       'localhost4',    
       'localhost4.localdomain4',    
       'training.puppetlabs.vm',    
       'training'   ],   
     ip => '127.0.0.1', 
   } 
   
   host { 'jweaver4.puppetlabs.vm':  
      ensure => present,  
      host_aliases => ['jweaver4'],  
      ip => $::ipaddress, 
   }
}
