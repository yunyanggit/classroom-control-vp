class system::admins {
  require mysql::server
  
  $admins = {
    'zack'   => { max_queries_per_hour => 1200 },
    'monica' => { max_queries_per_hour => 600 },
    'brad'   => { max_queries_per_hour => 600 },
    'luke'   => { max_queries_per_hour => 600 },
  }
  
  $admins.each |$user, $params| {
    mysql_user { "${user}@localhost":
      ensure => present,
      max_queries_per_hour => $params['max_queries_per_hour'],
    }
  
    mysql_user { 'ralph@localhost':
      ensure => absent,
    }
  
    user { 'ralph':
      ensure => absent,
    }
  
    user { $user,
      ensure => present,
    }
  }
}
