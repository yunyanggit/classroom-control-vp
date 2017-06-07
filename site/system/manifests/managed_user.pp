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

  $password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'
  
  user {$title:
   ensure => present,
   password => $password,
   managehome => true,
 }
 
 if $kernel == 'Linux' {
   file {"${homedir}/.bashrc":
     ensure => file,
     source => 'puppet:///modules/system/bashrc'
   }
  }
}   
