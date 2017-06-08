class profile::splunk::server {
  class { 'splunk':
    deploy => 'server',
    splunk_admin => 'harrison',
    splunk_admin_pass => 'wooki3',
  }
}
