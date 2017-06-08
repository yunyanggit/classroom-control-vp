class webapp (
  $docroot = $webapp::params::docroot
) inherits webapp::params {
    include mysql::server
    class { 'mysql::bindings':
        php_enable => true,
    }

    include apache
    include apache::mod::php
    apache::vhost { $facts['fqdn']:
        priority   => '10',
        vhost_name => $facts['fqdn'],
        port       => '80',
        docroot    => $docroot,
    }

    @@haproxy::balancermember { $facts['fqdn']:
        listening_service => 'webapp',
    }
}
