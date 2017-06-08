class webapp::wordpress {
include wordpress
class {'webapp':
docroot => '/opt/wordpress',
app_name => 'wordpress',
}
}
