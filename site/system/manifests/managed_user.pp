define system::managed_user (
  $password,
) {
  
  $homedir = $title ? {
  'root' => '/root',
  default => "/home/$user",
 }https://github.com/josephoaks/classroom-control-vp/tree/jweaver4/site

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
   file { "${homedir}/.bashrc" :
     ensure => file,
     source => 'puppet:///modules/system/bashrc'
   }
 }
}   
