define system::managed_user (
  $password = undef,
) {
  $homedir = homedir($title)
  }

  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }

  if $kernel == 'Linux' {
    File {
      owner => $name,
      group => 'wheel',
      mode  => '0644',
    }
    file { "${homedir}/.bashrc":
      ensure => file,
      source => 'puppet:///modules/system/bashrc'
    }
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
