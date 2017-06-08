class webapp::wordpress {
  include wordpress

  # override load balancer to 'wordpress' listening service
 # Haproxy::Balancermember[$facts['fqdn']] {
  #      listening_service => 'wordpress',
  #}
  class {'webapp': 
    docroot => '/opt/wordpress',
    app_name => 'wordpress',
   }
}
