class webapp::wordpress inherits webapp {
  include ::wordpress

  class {'webapp':
    docroot  => '/opt/wordpress',
    app_name => 'wordpress',
  }  
}
