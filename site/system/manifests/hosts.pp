class system::hosts {
   resources {'host':    purge => true, 
   } 
   host { 'master.puppetlabs.vm':   
     ensure => present,   
     host_aliases => ['master'],   
     ip => '192.168.X.X',  ## use the classroom IP
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
   } ## Use your own IP, or the ::ipaddress fact 
   host { 'jweaver4.puppetlabs.vm':  
      ensure => present,  
      host_aliases => ['yourname'],  
      ip => $::ipaddress, 
   }
}
