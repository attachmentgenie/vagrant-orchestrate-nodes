node /ci/ {

  class { 'profiles::bootstrap': }
  class { 'profiles::jenkinsci': }
}