# example declarations for the defined type exercise 
class examples::managed_users {
  $password = '$123456$'

  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
