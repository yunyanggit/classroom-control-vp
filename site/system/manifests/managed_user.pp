define system::managed_user (   
  $home = undef,  
 ) {   
  if $home {     
    $homedir = $home   
  }
  else {     
    $homedir = "/home/${name}"   
  }     
  File {      
    owner => $name,      
    group => 'wheel',      
    mode  => '0644',    
  }
}
