class webapp::wordpress inherits webapp {
  include ::wordpress

  # override load balancer to 'wordpress' listening service
  Haproxy::Balancermember[$facts['fqdn']] {
        listening_service => 'wordpress',
  }

  # override the vhost docroot to /opt/wordpress


}
