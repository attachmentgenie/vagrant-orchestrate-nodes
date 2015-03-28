class profile_rundeck () {

  class { 'rundeck': }
  class { 'puppetdb_rundeck': }

  rundeck::config::project { 'Platform project':
    file_copier_provider   => 'jsch-scp',
    node_executor_provider => 'jsch-ssh',
    resource_sources       => { platform => { project_name => 'Platform',
        source_type         => 'url',
        url                 => 'http://localhost:4567/api/yaml',
        include_server_node => true,
        resource_format     => 'resourceyaml',
        user                => $::rundeck::user,
        group               => $::rundeck::group,
      }
    }
  }

  motd::register{ 'Profile : profile_rundeck': }
}