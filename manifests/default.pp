hiera_include('classes')

stage { 'before':
  before => Stage['main'],
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

Package {
  allow_virtual => true,
}
