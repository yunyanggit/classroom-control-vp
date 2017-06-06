# Linux requires a hash for the password. This one is 'Puppet8Labs!'
# Generate your own with the command `openssl passwd -1` if you'd like.
$password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'

system::managed_user { ['aaron', 'kaitlin', 'alison']:
  password => $password,
}
define system::managed_user (
  $password,
  ) {
  $homedir = $title ? {
    'root' => '/root',
    default => "/home/$user",
  }
  # Puppet will evaluate these resources in the proper order because it's smart
  # and knows about dependencies between files and their owners
  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }
  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
    ensure => file,
    owner => $title,
    group => $title,
    mode => '0644',
    source => 'puppet:///modules/system/bashrc'
    }
  }
}
