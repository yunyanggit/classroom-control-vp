define system::managed_user (
  $home = undef,
) {
  
  $homedir = $title ? {
  'root' => '/root',
  default => "/home/$user",
 }

  File {
    ensure => file,
    owner => $title,
    group => $title,
    mode => '0644',  
  }

  user {$title:
   ensure => present,
   password => $password,
   managehome => true,
 }
 
 if $kernel == 'Linux' {
   file { 'bashrc' :
     ensure => file,
     path  => "${homedir}/.bashrc",
     source => 'puppet:///modules/system/bashrc'
   }
  }
}   
