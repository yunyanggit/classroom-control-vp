class system::managed_users (
  # Linux requires a hash for the password. This one is 'Puppet8Labs!'
  # Generate your own with the command `openssl passwd -1` if you'd like.
  $password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'
  # My password is 'Testing1'
  #String $password = '$1$Ofnsm86F$wSHAn73Quoq5nK1CfiMzJ/'
) {
  system::managed_user { ['johnny', 'helena']:
    password => $password,
  }
}