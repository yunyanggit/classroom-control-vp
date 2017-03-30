class webapp {
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
        docroot    => '/var/www/html',
    }

    include syslog_ng
    syslog_ng::log {'web app logging':
        source      => 's_src',
        filter_spec => 'program("httpd") and level(error..emerg)',
        file        => '/var/log/httpd'
    }
}
