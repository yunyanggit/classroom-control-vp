define system::managed_user (
  $home = undef,
  $password = undef,
) {
  if $home {
    $homedir = $home
  }
  else {
    $homedir = "/home/${name}"
  }

  password => $password

  File {
    owner => $name,
    group => 'wheel',
    mode  => '0644',
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    source => 'puppet:///modules/system/bashrc'
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
