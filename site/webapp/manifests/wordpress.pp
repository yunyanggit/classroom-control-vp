class webapp::wordpress inherits webapp {
  include ::wordpress

  class {'webapp':
    docroot  => '/opt/wordpress',
    app_name => 'wordpress',
  }
  
  # override load balancer to 'wordpress' listening service
  Haproxy::Balancermember[$facts['fqdn']] {
        listening_service => 'wordpress',
  }
}
