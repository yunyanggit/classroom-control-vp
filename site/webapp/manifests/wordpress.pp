class webapp::wordpress inherits webapp {
  include ::wordpress

  # override logging rules to include warnings
  Syslog_ng::Log {'web app logging':
    filter_spec => 'program("httpd") and level(debug..emerg)',
  }

  # override the vhost docroot to /opt/wordpress


}
