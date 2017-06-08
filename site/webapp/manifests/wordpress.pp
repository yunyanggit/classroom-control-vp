class webapp::wordpress {
  include wordpress

  class {'webapp':
    docroot =>  '/opt/wordpress',
    app_name  =>  'wrodpress',
  }

  ## Old code
  # inherits webapp {
  # include ::wordpress
  #
  # # override load balancer to 'wordpress' listening service
  # Haproxy::Balancermember[$facts['fqdn']] {
  #       listening_service => 'wordpress',
  # }
  
}
