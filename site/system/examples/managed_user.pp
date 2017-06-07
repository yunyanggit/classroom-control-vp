class examples::managed_users($password) {

  $password = '$1$VSUyFGs6$RGUYKnirie7v2AS9z06xd1'
  
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
