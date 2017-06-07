# example declarations for the defined type exercise 
class examples::managed_users(
  # My password is 'Testing1'
  $password = '$1$Ofnsm86F$wSHAn73Quoq5nK1CfiMzJ/'
) {
  system::managed_user { ['johnny', 'helena']:
    password => $password,
  }
}
