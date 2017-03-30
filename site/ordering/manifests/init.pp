class ordering {
  # include the ordering::mysql and ordering::epel classes
  # Do they need to be contained?

  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }
}
