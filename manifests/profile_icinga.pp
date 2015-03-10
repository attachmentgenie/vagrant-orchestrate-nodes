class profile_icinga (
  $is_server = false,
) {

  if str2bool($is_server) {
    class { '::apache': }
  }
  class {
    'icinga':
      server        => $is_server,
      icinga_admins => [ 'admin,', 'dummy1,', 'dummy2' ],
      plugins       => [ 'checkpuppet'];
  }
}