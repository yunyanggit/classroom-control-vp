class ordering {
  include  ordering::mysql 
  # Does it need to be contained?

  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }
}
