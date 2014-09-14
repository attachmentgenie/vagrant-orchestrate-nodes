node /log/ {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : log': }
}