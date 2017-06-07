define system::managed_user ( 
  $password,
 ){ 
   $homedir = $title ? {  
     'root' => '/root',  
     default => "/home/$user", 
   }
   
   user {$title:  
     ensure => present,  
     password => $password,  
     managehome => true, 
   }  
   if $kernel == 'Linux' {  
     file {'bashrc':    
       ensure => file,    
       owner => $title,    
       group => $title,
       path  => "${homedir}/.bashrc",
       mode  => '0644',    
       source => 'puppet:///modules/system/bashrc'  
     } 
   }
 }
   
