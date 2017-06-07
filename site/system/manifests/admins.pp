class system::admins {
  require mysql::server
  $admins = {
    'brad'   => { max_queries_per_hour => '600' },
    'monica' => { max_queries_per_hour => '600' },
    'luke'   => { max_queries_per_hour => '600' },
    'zack'   => { max_queries_per_hour => '1200' },
  }

  $admins.each |$user, $params| {
    mysql_user { "${user}@localhost":
      ensure => present,
      max_queries_per_hour => $params['max_queries_per_hour'],
    }
    user { $user:
      ensure => present,
      managehome => true,
    }
  }
  
  mysql_user { "ralpsh@localhost":
    ensure => absent,
  }
  user { 'ralph':
    ensure => absent,
  }
}  
