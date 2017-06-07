class system::admins_pick {
require mysql::server
$default_max_queries_per_hour = '600'
$retired = [ 'ralph' ]
$admins = {
'brad' => {},
'monica' => {},
'luke' => {},
'zack' => { max_queries_per_hour => '1200' },
}
$admins.each |$user, $params| {
mysql_user { "${user}@localhost":
ensure => present,
max_queries_per_hour => pick($params['max_queries_per_hour'],
$default_max_queries_per_hour),
}
user { $user:
ensure => present,
managehome => true,
}
}
$retired.each |$user| {
mysql_user { "${user}@localhost":
ensure => absent,
}
user { $user:
ensure => absent,
}
}
}
