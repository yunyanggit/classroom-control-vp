# example declarations for the defined type exercise 
class examples::managed_users($password) {
  system::managed_user { ['bear', 'tory', 'adam']:
    password => $password,
  }
}
