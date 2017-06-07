# example declarations for the defined type exercise 
class examples::managed_users {
  $password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
