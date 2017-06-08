class webapp::wordpress {
  include wordpress

  class { 'webapp':
    docroot => '/var/www/html',
    app_name => 'wordpress',
  }
    
  Haproxy::Balancermember[$facts['fqdn']] {
        listening_service => 'wordpress',
  }
  
}
